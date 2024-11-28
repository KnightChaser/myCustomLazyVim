-- ~/.config/nvim/lua/plugins/smear-cursor.lua
return {
  "sphamba/smear-cursor.nvim",

  opts = {
    -- Cursor color. Defaults to Cursor gui color
    cursor_color = "#d3cdc3",

    -- Background color. Defaults to Normal gui background color
    normal_bg = "#282828",

    smear_between_buffers = true,
    smear_between_neighbor_lines = true,
    use_floating_windows = true,
    legacy_computing_symbols_support = false,
  },
}
