-- ~/.config/nvim/lua/plugins/conform.lua

return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                python = { "black" },
            },
        })
    end,
}
