{
  pkgs,
  stdenv,
  ...
}: (with pkgs.vimPlugins;
  [
    todo-comments-nvim

    # Direnv
    direnv-vim
    telescope-fzf-native-nvim

    # Colorscheme
    kanagawa-nvim

    # Autocomplete
    nvim-cmp
    cmp-nvim-lsp

    luasnip
    cmp_luasnip

    # LSP
    nvim-lspconfig
    null-ls-nvim
    trouble-nvim

    # Fzf
    telescope-nvim

    # Syntax highlighting
    vim-nix

    (nvim-treesitter.withPlugins (plugins:
      (with plugins;
        [
          tree-sitter-yaml
          tree-sitter-toml
          tree-sitter-regex
          tree-sitter-python
          tree-sitter-nix
          tree-sitter-markdown
          tree-sitter-make
          tree-sitter-json
          tree-sitter-comment
          tree-sitter-cmake
          tree-sitter-c
          tree-sitter-cpp
          tree-sitter-bash
          tree-sitter-rust
          tree-sitter-haskell
        ])))

    which-key-nvim

    # Misc
    plenary-nvim
  ])
