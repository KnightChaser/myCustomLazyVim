-- ~/.config/nvim/init.lua or ~/.config/nvim/lua/config/options.lua

-- Basic configurations for improved usability
vim.opt.compatible = false -- Disable compatibility with old Vi
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.autoindent = true -- Auto-indent new lines
vim.opt.cursorline = true -- Highlight current line
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.tabstop = 4 -- Number of spaces in a tab
vim.opt.shiftwidth = 4 -- Spaces for each auto-indent step
vim.opt.hlsearch = true -- Highlight search results
vim.opt.incsearch = true -- Incremental search
vim.opt.smartcase = true -- Smart case search
vim.opt.ignorecase = true -- Case-insensitive search
vim.opt.wrap = true -- Wrap long lines
vim.opt.scrolloff = 8 -- Minimum lines to keep above/below the cursor
vim.cmd("syntax on") -- Enable syntax highlighting
