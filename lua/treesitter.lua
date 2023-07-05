
local treesitter_configs = require("nvim-treesitter.configs")

treesitter_configs.setup {
	indent = {
		enable = true,
	},
}

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

vim.o.foldenable = false
vim.o.foldlevel = 99
