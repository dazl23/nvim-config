{ lib
, pkgs
, neovim-unwrapped
, wrapNeovimUnstable
, neovimUtils
, callPackage
, makeWrapper
, lua51Packages
, ...
}:

let
  all-plugins = callPackage ./plugins.nix { };
  lua-config = callPackage ./lua/config.nix { };

  extra-packages = with pkgs; [
    pyright
    black

    rnix-lsp
    alejandra

    clang-tools

    rust-analyzer
    rustfmt
    gopls

    tree-sitter
  ];
  extra-make-wrapper-args = ''--suffix PATH : "${lib.makeBinPath extra-packages}"'';

  default-plugin = {
    type = "viml";
    plugin = null;
    config = "";
    optional = false;
    runtime = { };
  };

  # Plugins can be either a package or a Neovim plugin attribute set.
  # We need to normalize them such that they are all plugin attribute sets.
  normalized-plugins =
    builtins.map
      (plugin: default-plugin // (if (plugin ? plugin) then plugin else { inherit plugin; }))
      (all-plugins);

  suppress-not-viml-config = plugin:
    if plugin.type != "viml" then
      plugin // { config = ""; }
    else
      plugin;

  custom-rc = ''
    lua <<EOF
      -- Allow imports from common locations for some packages.
      -- This is required for things like lua_ls to work.
      local runtime_path = vim.split(package.path, ";")
      table.insert(runtime_path, "lua/?.lua")
      table.insert(runtime_path, "lua/?/init.lua")
    EOF


    " Custom Lua Config.
    ${lua-config}
  '';

  neovim-config = neovimUtils.makeNeovimConfig {
    viAlias = true;
    vimAlias = true;
    plugins = builtins.map suppress-not-viml-config normalized-plugins;
    customRC = custom-rc;
  };

  neovim-config-with-wrapper-args = neovim-config // {
    wrapRc = true;
    wrapperArgs =
      (lib.escapeShellArgs neovim-config.wrapperArgs) + " "
        + extra-make-wrapper-args;
  };

  wrapped-neovim = wrapNeovimUnstable neovim-unwrapped neovim-config-with-wrapper-args;
in
wrapped-neovim
