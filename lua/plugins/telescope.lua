-- ~/.config/nvim/lua/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  config = function()
    -- leader key
    vim.g.mapleader = "\\"

    -- Define Telescope key mappings
    vim.api.nvim_set_keymap("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>fh", "<Cmd>Telescope help_tags<CR>", { noremap = true, silent = true })
  end,
}
