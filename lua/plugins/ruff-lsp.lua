-- ~/.config/nvim/lua/plugins/ruff-lsp.lua
return {
    'neovim/nvim-lspconfig',
    opts = {
        servers = {
            ruff_lsp = {
                init_options = {
                    settings = {
                        -- Any extra CLI arguments for `ruff`
                        args = {}, -- Customize as needed
                    },
                },
            },
        },
    },
}
