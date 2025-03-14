-- ~/.config/nvim/lua/plugins/hlchunk.lua
return {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("hlchunk").setup({
            -- 1) Chunk Mod
            chunk = {
                enable = true,         -- Make sure chunk highlighting is active
                use_treesitter = true, -- Whether to use treesitter for code blocks
                style = {
                    "#806d9c",         -- normal chunk color
                    "#c21f30",         -- error color if code block is mismatched
                },
                chars = {
                    horizontal_line = "─",
                    vertical_line = "│",
                    left_top = "╭",
                    left_bottom = "╰",
                    right_arrow = ">",
                },
                textobject = "ic", -- e.g., 'ic' => 'inner chunk'
                priority = 15,     -- chunk priority (higher means drawn on top)
                -- You can add `exclude_filetypes`, `notify`, etc. if needed
            },

            -- 2) Indent Mod (optional)
            indent = {
                enable = false, -- Disable if you don’t want indent guides
                -- style = { ... }  -- Example if you do enable it
            },

            -- 3) Line Number Mod
            line_num = {
                enable = true,          -- Enable chunk-like highlighting via line numbers
                style = "#00ffff",      -- Must be a single hex color string
                priority = 30,          -- Set a priority higher than chunk if you want it more visible
                use_treesitter = false, -- You can switch this on if you prefer
                -- As with chunk, you could also use `exclude_filetypes` or `notify` if desired
            },

            -- 4) Blank Mod (optional)
            blank = {
                enable = false, -- Turn this on if you want blank line highlighting
                -- style = { ... }
            },
        })
    end,
}
