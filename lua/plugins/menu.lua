-- ~/.config/nvim/lua/plugins/menu.lua

return {
  {
    "nvzone/menu",
    lazy = true,
    config = function()
      -- Ensure menu plugin is properly configured
      vim.defer_fn(function()
        require("menu")
      end, 0)
    end,
  },
}

