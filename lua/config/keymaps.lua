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
local telescopeBuiltin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescopeBuiltin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", telescopeBuiltin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", telescopeBuiltin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", telescopeBuiltin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>c", function()
    require("telescope.builtin").commands()
end, { noremap = true, silent = true })


--- DAP(Debug Adapter Protocol)
-- DAP Keybindings
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })

-- Use alternative keybindings to avoid conflicts with terminalG
vim.keymap.set("n", "<F5>", function()
    require("dap").continue()
end, { desc = "DAP Continue" })

vim.keymap.set("n", "<Leader>do", function()
    require("dap").step_over()
end, { desc = "DAP Step Over" })

vim.keymap.set("n", "<Leader>di", function()
    require("dap").step_into()
end, { desc = "DAP Step Into" })

vim.keymap.set("n", "<Leader>du", function()
    require("dap").step_out()
end, { desc = "DAP Step Out" })

vim.keymap.set("n", "<Leader>b", function()
    require("dap").toggle_breakpoint()
end, { desc = "DAP Toggle Breakpoint" })

vim.keymap.set("n", "<Leader>B", function()
    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP Conditional Breakpoint" })

vim.keymap.set("n", "<Leader>lp", function()
    require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "DAP Log Point" })

vim.keymap.set("n", "<Leader>dr", function()
    require("dap").repl.open()
end, { desc = "DAP REPL Open" })

vim.keymap.set("n", "<Leader>dl", function()
    require("dap").run_last()
end, { desc = "DAP Run Last" })

-- DAP widget keybindings
vim.keymap.set("n", "<Leader>dc", function()
    require("dapui").toggle()
end, { desc = "DAP UI Toggle" })

-- :lua require('dap.ui.widgets').hover()
vim.keymap.set("n", "<Leader>dh", function()
    require("dap.ui.widgets").hover()
end, { desc = "DAP Hover" })

--- menu.nvim
-- Open the menu bar using Ctrl+t
vim.keymap.set("n", "<C-t>", function()
    local menu_options = require("menus.default") -- Load the default menu
    require("menu").open(menu_options, { mouse = false, border = true })
end, { noremap = true, silent = true, desc = "Open Menu Bar" })

--- NVIM terminal
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]],
    { noremap = true, silent = true, desc = "Exit from the terminal mode and return to the normal mode immediately" })

-- Exit terminal mode and trigger split switching with Ctrl-w
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]],
    { noremap = true, silent = true, desc = "Switch split from terminal immediately" })

-- My custom extension(UUIDv4 auto generator)
vim.keymap.set("n", "<leader>uib", ":UUIDv4ToBuffer<CR>", { desc = "Insert a random UUIDv4 to the buffer" })
vim.keymap.set("n", "<leader>uic", ":UUIDv4ToClipboard<CR>", { desc = "Copy a random UUIDv4 to the clipboard" })

-- My custom extension (hexadecimal auto generator with dynamic length input)
vim.keymap.set("n", "<leader>hib", function()
    -- Prompt the user to enter the desired length
    local length = vim.fn.input("Enter the length of the hex number: ", "16")
    -- Call the command with the user-specified length
    vim.cmd("HexGenToBuffer " .. length)
end, { desc = "Insert a random hexadecimal to the buffer with specified length" })

vim.keymap.set("n", "<leader>hic", function()
    -- Prompt the user to enter the desired length
    local length = vim.fn.input("Enter the length of the hex number: ", "16")
    -- Call the command with the user-specified length
    vim.cmd("HexGenToClipboard " .. length)
end, { desc = "Copy a random hexadecimal to the clipboard with specified length" })

-- Customized buffer manipulation keymaps
vim.keymap.set("n", "<leader>xbc", ":BufferClose<CR>", { desc = "Close the current buffer" })
vim.keymap.set("n", "<leader>xbac", ":BufferCloseAllButCurrent<CR>",
    { desc = "Close every opened buffer except current" })
vim.keymap.set("n", "<leader>xbf", ":BufferFirst<CR>", { desc = "Move to the first buffer" })
vim.keymap.set("n", "<leader>xbl", ":BufferLast<CR>", { desc = "Move to the last buffer" })
vim.keymap.set("n", "<leader>xbn", ":BufferNext<CR>", { desc = "Move to the next buffer" })
vim.keymap.set("n", "<leader>xbp", ":BufferPrevious<CR>", { desc = "Move to the previous buffer" })
