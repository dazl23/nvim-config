{ lib
, substituteAll
, symlinkJoin
, makeWrapper
, runCommand
, ...
}:

with lib;
let
  # Usage:
  # mkLuaConfig ./some-file.lua {
  #   MY_ARG = "hello-world";
  # }
  mkLuaConfig = file: args:
    let module =
      substituteAll
        (args // {
          src = file;
        });
    in
    "luafile ${module}";

  # Usage:
  # mkLuaConfigs [
  #   ./some-file.lua
  #   { file = ./some-other.lua; options = { MY_ARG = "hello-world"; }; }
  # ]
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
  ./treesitter.lua
  ./telescope.lua
  ./lspconfig.lua
]

