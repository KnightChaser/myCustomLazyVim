-- ~/.config/nvim/lua/plugins/satellite.lua

return {
    "lewis6991/satellite.nvim",
    config = function()
        require('satellite').setup {
            current_only = false,  -- Display decorations for all windows
            winblend = 50,         -- Set transparency for the scrollbar
            zindex = 40,           -- Set scrollbar rendering priority
            excluded_filetypes = { -- Filetypes to exclude from the scrollbar
                "NvimTree", "packer", "dashboard", "help"
            },
            width = 2,             -- Width of the scrollbar
            handlers = {
                cursor = {
                    enable = true,  -- Highlight the current cursor position
                    symbols = { '⎺', '⎻', '⎼', '⎽' }, -- Use fancy symbols for cursor
                },
                search = {
                    enable = true,  -- Show search results in the scrollbar
                },
                diagnostic = {
                    enable = true,  -- Highlight diagnostic issues
                    signs = { '-', '=', '≡' }, -- Symbols for severity levels
                    min_severity = vim.diagnostic.severity.HINT, -- Minimum severity to show
                },
                gitsigns = {
                    enable = true, -- Show git changes in the scrollbar
                    signs = {      -- Use different symbols for git changes
                        add = "│",
                        change = "│",
                        delete = "-",
                    },
                },
                marks = {
                    enable = true,       -- Show marks in the scrollbar
                    show_builtins = true, -- Show built-in marks like [ ] < >
                    key = 'm',           -- Mark key for navigation
                },
                quickfix = {
                    enable = true, -- Highlight quickfix list locations
                    signs = { '-', '=', '≡' },
                },
            },
        }

        -- Optionally, add keybindings for Satellite commands
        vim.api.nvim_set_keymap("n", "<Leader>sd", ":SatelliteDisable<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<Leader>se", ":SatelliteEnable<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<Leader>sr", ":SatelliteRefresh<CR>", { noremap = true, silent = true })
    end
}

