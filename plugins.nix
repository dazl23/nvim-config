{
  pkgs,
  stdenv,
  ...
}: (with pkgs.vimPlugins;
  [
    # File browser
    nvim-tree-lua
    nvim-web-devicons

    lualine-nvim
    bufferline-nvim

    todo-comments-nvim

    # Direnv
    direnv-vim

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

    # tmux
    vim-tmux-navigator

    # Syntax highlighting
    vim-nix

    nvim-treesitter.withAllGrammars

    # Misc
    plenary-nvim
  ])
