-- ~/.config/nvim/lua/config/startup_nvim.lua

local startup = {}

-- Header Section with ASCII Art
startup.header = {
  type = "text",
  align = "center",
  fold_section = false,
  title = "Welcome",
  margin = 5,
  content = {
    " ███╗   ██╗██╗   ██╗██╗███╗   ███╗ ",
    " ████╗  ██║██║   ██║██║████╗ ████║ ",
    " ██╔██╗ ██║██║   ██║██║██╔████╔██║ ",
    " ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    " ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    " ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  },
  highlight = "String",
  default_color = "#56b6c2",
}

-- Menu Section with Mappings
startup.menu = {
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
  fold_section = false,
  title = "Commands",
  margin = 5,
  highlight = "Keyword",
  default_color = "#c678dd",
}

-- Footer Section with Date and Time
startup.footer = {
  type = "text",
  align = "center",
  content = function()
    -- YYYY/MM/DD date will be shwon
    local date = " " .. os.date("%Y/%m/%d")
    return { date }
  end,
  fold_section = false,
  title = "Time",
  margin = 5,
  highlight = "Constant",
  default_color = "#98c379",
}

startup.parts = { "header", "menu", "footer" }

return startup
