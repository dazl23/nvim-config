
local telescope = require("telescope")
local api = require ("telscope.builtin")

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
  },
}


vim.keymap.set("n", "ff", require("api").find_files, { desc = "Find File" })

vim.keymap.set("n", "fr", require("api").oldfiles, { desc = "Recent File" })

vim.keymap.set("n", "fb", require("api").buffers, { desc = "[ ] Find existing buffers" })

vim.keymap.set("n", "fg", require("api").live_grep, { desc = "[S]earch by [G]rep" })
