return {
  'rafcamlet/nvim-luapad',
  config = function()
    require('luapad').setup {
      count_limit = 150000,         -- Optional: Increase limit for complex code
      error_indicator = false,      -- Optional: Disable error text
      eval_on_move = true,          -- Optional: Enable eval on cursor move
      split_orientation = 'horizontal', -- Optional: Change to horizontal
      on_init = function()
        print('Hello from Luapad!')
      end,
      context = {
        the_answer = 42,
        shout = function(str) return string.upper(str) .. '!' end
      }
    }
  end,
  requires = { "antoinemadec/FixCursorHold.nvim" } -- Required if your Neovim version is older than v0.8.0
}

