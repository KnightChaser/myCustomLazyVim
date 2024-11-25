-- ~/.config/nvim/lua/plugins/colorscheme.lua
return { 
  -- scottmckendry/cyberdream.nvim
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },

  -- folke/tokyonight.nvim
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- maxmx03/fluoromachine.nvim
  {
    'maxmx03/fluoromachine.nvim',
    lazy = false,
    priority = 1000,
    config = function ()
    local fm = require 'fluoromachine'

    fm.setup {
       glow = true,
       theme = 'delta',
       transparent = true,
    }
    end
  },
}
