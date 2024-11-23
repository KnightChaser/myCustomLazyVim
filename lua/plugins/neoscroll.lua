-- ~/.config/nvim/lua/plugins/neoscroll.lua
return {
  "karb94/neoscroll.nvim",
  config = function()
    local neoscroll = require("neoscroll")

    -- Basic setup
    neoscroll.setup({
      mappings = {
        "<C-u>", "<C-d>",
        "<C-b>", "<C-f>",
        "<C-y>", "<C-e>",
        "zt", "zz", "zb",
      },
      hide_cursor = true,          -- Hide cursor while scrolling
      stop_eof = true,             -- Stop at <EOF> when scrolling downwards
      respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin
      cursor_scrolls_alone = true, -- The cursor will keep scrolling even if the window cannot scroll further
      easing = "quadratic",        -- Default easing function
      performance_mode = false,    -- Disable "Performance Mode" for all buffers
    })

    -- Define custom mappings with specific easing functions
    local keymap = {
      ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 250, easing = "sine" }) end,
      ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 250, easing = "sine" }) end,
      ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 450, easing = "circular" }) end,
      ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 450, easing = "circular" }) end,
      ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 }) end,
      ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor = false, duration = 100 }) end,
      ["zt"]    = function() neoscroll.zt({ half_win_duration = 250 }) end,
      ["zz"]    = function() neoscroll.zz({ half_win_duration = 250 }) end,
      ["zb"]    = function() neoscroll.zb({ half_win_duration = 250 }) end,
    }

    -- Apply custom mappings
    local modes = { "n", "v", "x" }
    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
    end
  end,
}

