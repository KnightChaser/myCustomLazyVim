-- ~/.config/nvim/lua/config/keymaps.lua

--- barbar.nvim
-- Move to previous/next buffer
vim.api.nvim_set_keymap("n", "<A-,>", "<Cmd>BufferPrevious<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-.>", "<Cmd>BufferNext<CR>", { noremap = true })

-- Re-order to previous/next buffer
vim.api.nvim_set_keymap("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A->>", "<Cmd>BufferMoveNext<CR>", { noremap = true })

-- Goto buffer in position
for i = 1, 9 do
  vim.api.nvim_set_keymap("n", "<A-" .. i .. ">", "<Cmd>BufferGoto " .. i .. "<CR>", { noremap = true })
end
vim.api.nvim_set_keymap("n", "<A-0>", "<Cmd>BufferLast<CR>", { noremap = true })

-- Pin/unpin buffer
vim.api.nvim_set_keymap("n", "<A-p>", "<Cmd>BufferPin<CR>", { noremap = true })

-- Close and restore buffer
vim.api.nvim_set_keymap("n", "<A-c>", "<Cmd>BufferClose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-s-c>", "<Cmd>BufferRestore<CR>", { noremap = true })

--- telescope.nvim
-- Find files using telescope command-line sugar.
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
