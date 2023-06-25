{
  pkgs,
  stdenv,
  ...
}: (with pkgs.vimPlugins;
  [
    completion-nvim
    nvim-cmp
    cmp-nvim-lsp
    luasnip
    vim-nix
    todo-comments-nvim
    nvim-tree-lua
    nvim-web-devicons
    bufferline-nvim
    direnv-vim
    nvim-lspconfig
    null-ls-nvim
    telescope-nvim
    plenary-nvim
    kanagawa-nvim
    nvim-gdb

    (nvim-treesitter.withPlugins (plugins:
      (with plugins;
        [
          tree-sitter-python
          tree-sitter-nix
          tree-sitter-markdown
          tree-sitter-cmake
          tree-sitter-make
          tree-sitter-json
          tree-sitter-dockerfile
          tree-sitter-c
          tree-sitter-cpp
          tree-sitter-bash
          tree-sitter-rust
          tree-sitter-lua
          tree-sitter-haskell
        ])))


    # Plugin configuration
    (stdenv.mkDerivation {
      name = "nvim-config";
      src = ./lua;
      installPhase = ''
        mkdir -p $out/lua
        mv * $out/lua
      '';
    })
  ])
