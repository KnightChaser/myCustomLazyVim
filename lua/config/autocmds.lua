-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd("NvimTreeToggle")
        vim.cmd("Hardtime enable")  -- I guess I nedd some neovim training!!!
    end,
})

