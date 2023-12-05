{ lib
, substituteAll
, symlinkJoin
, makeWrapper
, runCommand
, ...
}:

with lib;
let
  mkLuaConfig = file: args:
    let module =
      substituteAll
        (args // {
          src = file;
        });
    in
    "luafile ${module}";

  mkLuaConfigs = files:
    lib.concatMapStringsSep "\n"
      (file:
        if builtins.isAttrs file then
          mkLuaConfig file.file file.options
        else
          mkLuaConfig file { }
      )
      files;
in
mkLuaConfigs [
  ./vim.lua
  ./theme.lua
  ./which-key.lua
  ./telescope.lua
  ./lspconfig.lua
  ./cmp.lua
  ./treesitter.lua
]

