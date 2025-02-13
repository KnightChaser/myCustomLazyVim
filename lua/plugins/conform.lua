-- ~/.config/nvim/lua/plugins/conform.lua

return {
  "stevearc/conform.nvim",
-- "Note: Don't overwrite the default keymaps for nvim-ufo. Instead, add your own keymaps to ~/.config/nvim/lua/plugins/conform.lua."
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
    },
    -- You can add other options here as needed.
  },
}

