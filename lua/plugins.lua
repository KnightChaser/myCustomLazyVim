-- ~/.config/nvim/lua/plugins.lua

return {
  -- LuaSnip configuration (optional, if not already set)
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip").setup({
        -- Your LuaSnip configurations
      })
    end,
  },

  -- Add any other plugins here
}
