-- lua/startup/themes/my_theme.lua

local ascii_art = {
  "███╗   ██╗███████╗██╗   ██╗██╗   ██╗",
  "████╗  ██║██╔════╝██║   ██║██║   ██║",
  "██╔██╗ ██║█████╗  ██║   ██║██║   ██║",
  "██║╚██╗██║██╔══╝  ╚██╗ ██╔╝╚██╗ ██╔╝",
  "██║ ╚████║███████╗ ╚████╔╝  ╚████╔╝ ",
  "╚═╝  ╚═══╝╚══════╝  ╚═══╝    ╚═══╝  ",
}

local startup_sections = {
  header = {
    type = "text",
    align = "center",
    content = ascii_art,
    highlight = "String",
    margin = 5,
  },
  mappings = {
    type = "mapping",
    align = "center",
    content = {
      { " Find File", "Telescope find_files", "<leader>ff" },
      { " Find Word", "Telescope live_grep", "<leader>lg" },
      { " Recent Files", "Telescope oldfiles", "<leader>of" },
      { " File Browser", "Telescope file_browser", "<leader>fb" },
      { " Colorschemes", "Telescope colorscheme", "<leader>cs" },
      { " New File", "lua require'startup'.new_file()", "<leader>nf" },
    },
    highlight = "Function",
    margin = 5,
  },
}

return {
  sections = startup_sections,
  options = {
    mapping_keys = true,
    cursor_column = 0.5,
    after = function()
      -- Optional: Add any commands you want to execute after startup
    end,
    empty_lines_between_mappings = true,
    disable_statuslines = true,
    paddings = { 1, 2 },
  },
  colors = {
    background = "#1f2227",
    folded_section = "#56b6c2",
  },
  parts = { "header", "mappings" },
  theme = "dashboard",
}
