# nix-env -f "<nixpkgs>" -qaP -A haskell.compiler
{ compiler ? "ghc843" }:

let
  fetchNixpkgs = import ./fetchNixpkgs.nix;

  jailbreak = newPkgs: oldPkgs: {
    mkDerivation = args: oldPkgs.mkDerivation (args // {
      doCheck = false;
      jailbreak = true;
      doHaddock = false;
    });
  };

  loadAllPackages = directory: pkgsNew:
    let
      paths = builtins.attrNames (builtins.readDir directory);

      toKeyVal = file: {
        name  = builtins.replaceStrings [ ".nix" ] [ "" ] file;

        value = pkgsNew.callPackage (directory + "/${file}") { };
      };

    in
      builtins.listToAttrs (map toKeyVal paths)
      ;

  config = {
    packageOverrides = pkgs: rec {
      haskellPackages =  pkgs.haskell.packages // {
          "${compiler}" = pkgs.haskell.packages."${compiler}".override {
             overrides = pkgs.lib.fold pkgs.lib.composeExtensions (_: _: {})
             [
               jailbreak

               (haskellPackagesNew: haskellPackagesOld:
                 (loadAllPackages ./nix haskellPackagesNew)
                 // {
                    broken = haskellPackagesNew.callPackage ./broken.nix { };
                 }
               )
             ];
         };
       };
     };
   };

  pkgs = import (fetchNixpkgs {
      # name = "nixpkgs-1809";
      # url = https://github.com/nixos/nixpkgs/;
      rev = "6a3f5bcb061e1822f50e299f5616a0731636e4e7";
      ## nix-prefetch-url --unpack <url>
      sha256 = "1ib96has10v5nr6bzf7v8kw7yzww8zanxgw2qi1ll1sbv6kj6zpd";
   }) { inherit config; };

in
{ broken = pkgs.haskellPackages.${compiler}.broken;
}
