-- ~/.config/nvim/lua/plugins/tiny_inline_diagnostic.lua
return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Plugin loads lazily for better startup performance
    priority = 1000, -- Ensures the plugin is loaded early
    config = function()
        require("tiny-inline-diagnostic").setup({
            signs = {
                left = "", -- Left decorative sign
                right = "", -- Right decorative sign
                diag = "●", -- Default diagnostic sign
                arrow = "  ", -- Arrow for navigation
            },
            hi = {
                error = "DiagnosticError", -- Highlight group for errors
                warn = "DiagnosticWarn", -- Highlight group for warnings
                info = "DiagnosticInfo", -- Highlight group for info messages
                hint = "DiagnosticHint", -- Highlight group for hints
                background = "CursorLine", -- Diagnostic background
                mixing_color = "#282c34", -- Mixing color to blend the background
            },
            blend = {
                factor = 0.3, -- Slightly adjust the blend factor for aesthetics
            },
            options = {
                show_source = true, -- Display source of diagnostics
                throttle = 0, -- No delay for updates for better visuals
                softwrap = 15, -- Messages shorter than 15 stay inline
                multilines = true, -- Enable multilines for better readability
                multiple_diag_under_cursor = true, -- Show all diagnostics under cursor
                enable_on_insert = false, -- Disable diagnostics in Insert mode
                overflow = {
                    mode = "wrap", -- Wrap overflowed messages
                },
                format = function(diagnostic)
                    return string.format("%s [%s]", diagnostic.message, diagnostic.source)
                end, -- Custom format to include the source in diagnostics
                break_line = {
                    enabled = true, -- Enable break line for long messages
                    after = 40, -- Break after 40 characters
                },
                severity = {
                    vim.diagnostic.severity.ERROR,
                    vim.diagnostic.severity.WARN,
                    vim.diagnostic.severity.INFO,
                    vim.diagnostic.severity.HINT,
                },
                virt_texts = {
                    priority = 3000, -- High priority to override other virtual texts
                },
            },
        })

        -- Recommended: Disable Neovim's default virtual text diagnostics
        vim.diagnostic.config({ virtual_text = false })
    end,
}

