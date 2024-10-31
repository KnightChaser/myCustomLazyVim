-- ~/.config/nvim/lua/plugins/mason.lua

return {
  -- Mason: Manage external editor tooling (LSP servers, DAP servers, linters, and formatters)
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  -- Mason-LSPConfig: Bridge between mason and lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "pyright" }, -- Added "pyright" here
      })
    end,
  },
}
