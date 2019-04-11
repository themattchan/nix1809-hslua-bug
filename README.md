# nix1809-hslua-bug

Steps to repro:

1. start `nix-shell`


```
....

Preprocessing library for hslua-1.0.2..
Building library for hslua-1.0.2..
[ 1 of 15] Compiling Foreign.Lua.Core.Types ( dist/build/Foreign/Lua/Core/Types.hs, dist/build/Foreign/Lua/Core/Types.o )
[ 2 of 15] Compiling Foreign.Lua.Core.Constants ( dist/build/Foreign/Lua/Core/Constants.hs, dist/build/Foreign/Lua/Core/Constants.o )
[ 3 of 15] Compiling Foreign.Lua.Utf8 ( src/Foreign/Lua/Utf8.hs, dist/build/Foreign/Lua/Utf8.o )
[ 4 of 15] Compiling Foreign.Lua.Core.Error ( src/Foreign/Lua/Core/Error.hs, dist/build/Foreign/Lua/Core/Error.o )
clang-5.0: warning: argument unused during compilation: '-nopie' [-Wunused-command-line-argument]
clang-5.0: warning: argument unused during compilation: '-nopie' [-Wunused-command-line-argument]
ld: warning: /nix/store/567l21pfpvjb3lr5c6hgshasn589raal-libiconv-osx-10.11.6/lib/libiconv.dylib, ignoring unexpected dylib file
clang-5.0: warning: argument unused during compilation: '-nopie' [-Wunused-command-line-argument]
clang-5.0: warning: argument unused during compilation: '-nopie' [-Wunused-command-line-argument]
ld: warning: /nix/store/567l21pfpvjb3lr5c6hgshasn589raal-libiconv-osx-10.11.6/lib/libiconv.dylib, ignoring unexpected dylib file
[ 5 of 15] Compiling Foreign.Lua.Core.RawBindings ( dist/build/Foreign/Lua/Core/RawBindings.hs, dist/build/Foreign/Lua/Core/RawBindings.o )
clang-5.0: warning: argument unused during compilation: '-nopie' [-Wunused-command-line-argument]
clang-5.0: warning: argument unused during compilation: '-nopie' [-Wunused-command-line-argument]
ld: warning: /nix/store/567l21pfpvjb3lr5c6hgshasn589raal-libiconv-osx-10.11.6/lib/libiconv.dylib, ignoring unexpected dylib file
clang-5.0: warning: argument unused during compilation: '-nopie' [-Wunused-command-line-argument]
clang-5.0: warning: argument unused during compilation: '-nopie' [-Wunused-command-line-argument]
ld: warning: /nix/store/567l21pfpvjb3lr5c6hgshasn589raal-libiconv-osx-10.11.6/lib/libiconv.dylib, ignoring unexpected dylib file
[ 6 of 15] Compiling Foreign.Lua.Core.Functions ( src/Foreign/Lua/Core/Functions.hs, dist/build/Foreign/Lua/Core/Functions.o )
[ 7 of 15] Compiling Foreign.Lua.Core.Auxiliary ( dist/build/Foreign/Lua/Core/Auxiliary.hs, dist/build/Foreign/Lua/Core/Auxiliary.o )
clang-5.0: warning: argument unused during compilation: '-nopie' [-Wunused-command-line-argument]

/private/var/folders/fb/845d7wfd21g3flzcchdmcq740000gn/T/nix-build-hslua-1.0.2.drv-0/ghc40974_0/ghc_63.c:12:145: error:
     error: returning 'void' from a function with incompatible result type 'HsInt32' (aka 'int')
   |
12 | HsInt32 ghczuwrapperZC2ZChsluazm1zi0zi2zm7BLqVITBqeMJPeCIxGzzpfTZCForeignziLuaziCoreziAuxiliaryZCluaLzugetmetatable(void* a1, void* a2) {return luaL_getmetatable(a1, a2);}
   |                                                                                                                                                 ^
HsInt32 ghczuwrapperZC2ZChsluazm1zi0zi2zm7BLqVITBqeMJPeCIxGzzpfTZCForeignziLuaziCoreziAuxiliaryZCluaLzugetmetatable(void* a1, void* a2) {return luaL_getmetatable(a1, a2);}
                                                                                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~

/nix/store/jn4cqfhqikdk0p71ickylaym2z60gc7h-lua-5.2.4/include/lauxlib.h:130:32: error:
     note: expanded from macro 'luaL_getmetatable'
    |
130 | #define luaL_getmetatable(L,n)  (lua_getfield(L, LUA_REGISTRYINDEX, (n)))
    |                                ^
#define luaL_getmetatable(L,n)  (lua_getfield(L, LUA_REGISTRYINDEX, (n)))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/private/var/folders/fb/845d7wfd21g3flzcchdmcq740000gn/T/nix-build-hslua-1.0.2.drv-0/ghc40974_0/ghc_63.c:16:130: error:
     error: use of undeclared identifier 'LUA_PRELOAD_TABLE'
   |
16 | void* ghczuwrapperZC4ZChsluazm1zi0zi2zm7BLqVITBqeMJPeCIxGzzpfTZCForeignziLuaziCoreziAuxiliaryZCLUAzuPRELOADzuTABLE(void) {return LUA_PRELOAD_TABLE;}
   |                                                                                                                                  ^
void* ghczuwrapperZC4ZChsluazm1zi0zi2zm7BLqVITBqeMJPeCIxGzzpfTZCForeignziLuaziCoreziAuxiliaryZCLUAzuPRELOADzuTABLE(void) {return LUA_PRELOAD_TABLE;}
                                                                                                                                 ^

/private/var/folders/fb/845d7wfd21g3flzcchdmcq740000gn/T/nix-build-hslua-1.0.2.drv-0/ghc40974_0/ghc_63.c:18:129: error:
     error: use of undeclared identifier 'LUA_LOADED_TABLE'
   |
18 | void* ghczuwrapperZC5ZChsluazm1zi0zi2zm7BLqVITBqeMJPeCIxGzzpfTZCForeignziLuaziCoreziAuxiliaryZCLUAzuLOADEDzuTABLE(void) {return LUA_LOADED_TABLE;}
   |                                                                                                                                 ^
void* ghczuwrapperZC5ZChsluazm1zi0zi2zm7BLqVITBqeMJPeCIxGzzpfTZCForeignziLuaziCoreziAuxiliaryZCLUAzuLOADEDzuTABLE(void) {return LUA_LOADED_TABLE;}
                                                                                                                                ^
3 errors generated.

<no location info>: error:
    `cc' failed in phase `C Compiler'. (Exit code: 1)
builder for ‘/nix/store/18nfhw70rnnabbwrgf4wmmzq06m8mbr9-hslua-1.0.2.drv’ failed with exit code 1
cannot build derivation ‘/nix/store/k11flnw4jpc0jp9vmgvjdlrglj7k553f-pandoc-2.6.drv’: 1 dependencies couldn't be built
error: build of ‘/nix/store/k11flnw4jpc0jp9vmgvjdlrglj7k553f-pandoc-2.6.drv’ failed
/Users/matt/.nix-profile/bin/nix-shell: failed to build all dependencies
```
