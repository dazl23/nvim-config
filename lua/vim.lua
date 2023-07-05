

require('kanagawa').setup({
  colors = {
  theme = {
    all = {
      ui = {
        bg_gutter = "none"
      }
    }
  }
  }
})

vim.cmd("colorscheme kanagawa")

require("lspconfig")
require("nvim-tree")
require("telescope")
--require("")
