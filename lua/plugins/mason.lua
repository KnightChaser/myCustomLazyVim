-- ~/.config/nvim/lua/plugins/mason.lua

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "clangd", "pyright", "ruff-lsp" }, -- Added "ruff-lsp"
            })
        end,
    },
}
