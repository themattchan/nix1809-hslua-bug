{ mkDerivation, base, blaze-html, blaze-markup, containers
, directory, filepath, lens, neat-interpolation, pandoc
, pandoc-citeproc, pandoc-lens, process, stdenv, text, time
, transformers
}:
mkDerivation {
  pname = "broken";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base blaze-html blaze-markup containers directory filepath lens
    neat-interpolation pandoc pandoc-citeproc pandoc-lens process text
    time transformers
  ];
  license = stdenv.lib.licenses.mit;
}
