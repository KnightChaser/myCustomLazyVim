-- ~/.config/nvim/lua/plugins/minty.lua

return {
  -- Required dependency for minty
  { "nvzone/volt", lazy = true },

  -- Minty color picker plugin
  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" }, -- Lazy load on commands
    config = function()
      -- Optionally configure minty here
      -- Default settings are usually sufficient
    end,
  },
}

