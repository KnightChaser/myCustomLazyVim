-- ~/.config/nvim/lua/plugins/toggleterm.lua

return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
        -- Key mapping to toggle terminal mode (works in normal and insert modes)
        open_mapping = [[<c-\>]],

        -- Set terminal appearance options
        shade_terminals = true, -- Differentiate terminals from normal buffers
        direction = "float", -- Use floating windows for a sleek look
        float_opts = {
            border = "curved", -- Gives a modern, curved border style
            winblend = 3,   -- Slight transparency for a cool effect
        },

        -- Size configuration for non-floating terminals
        size = function(term)
            if term.direction == "horizontal" then
                return 15          -- height for horizontal split
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.4 -- width for vertical split
            end
        end,

        persist_size = true, -- Remember terminal size between sessions
        auto_scroll = true, -- Always scroll to the bottom on output

        -- Optional: enable terminal mappings in insert mode (adjust as per your taste)
        insert_mappings = true,
        terminal_mappings = true,

        -- Persist the terminal mode (useful if you're running processes you want to come back to)
        persist_mode = true,

        -- Additional settings to make the experience smoother:
        close_on_exit = true, -- Auto-close terminal when the job finishes
        shell = vim.o.shell, -- Use your default shell
    },
}

