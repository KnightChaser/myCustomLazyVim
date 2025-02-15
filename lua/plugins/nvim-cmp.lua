-- ~/.config/nvim/lua/plugins/nvim-cmp.lua

return {
    -- nvim-cmp (and its cmdline sources)
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "cmp-cmdline",
        },
        config = function()
            local cmp = require("cmp")

            -- Ensure that completions trigger automatically on text change
            local auto_trigger = {
                autocomplete = { cmp.TriggerEvent.TextChanged },
            }

            -- For search ("/") cmdline: use the current buffer as source.
            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' },
                },
                completion = auto_trigger,
            })

            -- For command (":") cmdline: combine path and command completions.
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' },
                }, {
                    {
                        name = 'cmdline',
                        option = {
                            ignore_cmds = { 'Man', '!' },
                        },
                    },
                }),
                completion = auto_trigger,
            })
        end,
    },

    -- noice.nvim: Replaces the cmdline and popupmenu UI for a prettier experience.
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            cmdline = {
                enabled = true, -- activate Noice's cmdline UI
                view = "cmdline_popup", -- use a floating popup (change to "cmdline" for classic bottom style)
            },
            popupmenu = {
                enabled = true, -- enable Noice's popupmenu UI for completions
                backend = "nui", -- use nui.nvim for rendering the popupmenu
            },
            presets = {
                command_palette = true, -- aligns the cmdline and popupmenu for a unified look
            },
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },
}
