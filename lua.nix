{ 
  stdenv,
  lib,
  ...
}:
let
  rawLua = builtins.readFile ./init.lua;
  nixStoreLua = builtins.toFile "init.lua" rawLua;
in
  stdenv.mkDerivation {
    name = "init-lua";
    src = nixStoreLua;
    dontUnpack = true;
    buildPhase = ''
    cp $src init.lua
    '';
    installPhase = ''
      mv init.lua $out
    '';
  }

