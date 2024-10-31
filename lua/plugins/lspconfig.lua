-- ~/.config/nvim/lua/plugins/lspconfig.lua

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      -- Add other dependencies if needed
    },
    config = function()
      require("config.lsp")
      require("config.cmp") -- Ensure this is loaded for autocompletion
    end,
  },
}
