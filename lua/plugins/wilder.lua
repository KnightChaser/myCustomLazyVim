-- ~/.config/nvim/lua/plugins/wilder.lua
return {
  "gelguy/wilder.nvim",
  config = function()
    local wilder = require('wilder')
    wilder.setup({ modes = { ':', '/', '?' } })

    -- Configure fuzzy matching and pipelines
    wilder.set_option('pipeline', {
      wilder.branch(
        wilder.cmdline_pipeline({
          fuzzy = 1, -- Enable fuzzy matching
          set_pcre2_pattern = 1, -- Use PCRE2 for better pattern matching
        }),
        wilder.python_search_pipeline({
          pattern = wilder.python_fuzzy_pattern(),
        })
      ),
    })

    -- Use popupmenu_palette_theme for command palette style
    wilder.set_option('renderer', wilder.popupmenu_renderer(
      wilder.popupmenu_palette_theme({
        border = 'rounded', -- Border style: 'single', 'double', 'rounded', etc.
        max_height = '75%', -- Maximum height of the popup menu
        min_height = 0, -- Minimum height (set to 0 for dynamic height)
        prompt_position = 'top', -- Position of the prompt: 'top' or 'bottom'
        reverse = 0, -- Display items from top to bottom
        highlights = {
          border = 'Normal', -- Highlight group for the border
        },
        highlighter = wilder.basic_highlighter(), -- Highlight matches
      })
    ))
  end,
}

