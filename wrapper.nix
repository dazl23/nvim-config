{ 
  callPackage,
  buildPackages,
  wrapNeovimUnstable,
  neovimUtils,
  lib,
  pkgs,
  writeText,
  plugins ? [],
  luaFile,
  neovim-unwrapped,
  unwrappedTarget ? neovim-unwrapped,
  extraLuaPackages ? (_: []),
  extraPython3Packages ? (_: []),
  withPython3 ? true,
  withRuby ? false,
  viAlias ? true,
  vimAlias ? true,
  ...
}: let

  vimConfig = ''luafile ${luaFile}'';

  extraBin = (with pkgs; [ 
     clang-tools
     rnix-lsp
     alejandra
     black
     rustfmt
     pyright
     rust-analyzer
    ]);
  
  binPath = lib.makeBinPath extraBin;

  neovimConfig = neovimUtils.makeNeovimConfig {
    inherit plugins extraPython3Packages withPython3 withRuby viAlias vimAlias;
    customRC = vimConfig;
  };

  luaPackages = unwrappedTarget.lua.pkgs;
  resolvedExtraLuaPackages = extraLuaPackages luaPackages;

  makeWrapperArgsFromPackages = op:
  lib.lists.foldr
  (next: prev: prev ++ [";" (op next)]) []
  resolvedExtraLuaPackages;

  extraMakeWrapperLuaCArgs =
    lib.optionals (resolvedExtraLuaPackages != [])
      (["--suffix" "LUA_CPATH" ";"]
      ++ (makeWrapperArgsFromPackages luaPackages.getLuaCPath));

  extraMakeWrapperLuaArgs =
    lib.optionals (resolvedExtraLuaPackages != [])
	(["--suffix" "LUA_PATH" ";"]
	 ++ (makeWrapperArgsFromPackages luaPackages.getLuaPath));

wrapperArgs =
	neovimConfig.wrapperArgs
	++ extraMakeWrapperLuaArgs
	++ extraMakeWrapperLuaCArgs
	++ ["--suffix" "PATH" ":" "${binPath}"];

in
  wrapNeovimUnstable unwrappedTarget (neovimConfig
			// {inherit wrapperArgs;})
