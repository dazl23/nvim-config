
local telescope = require("telescope")

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


vim.keymap.set("n", "ff", require("telescope.builtin").find_files, { desc = "Find File" })

vim.keymap.set("n", "fr", require("telescope.builtin").oldfiles, { desc = "Recent File" })

vim.keymap.set("n", "fb", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })

vim.keymap.set("n", "fg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
