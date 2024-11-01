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

-- Footer Section with Date, Time, and Random Quote
startup.footer = {
  type = "text",
  align = "center",
  content = function()
    local date = " " .. os.date("%Y/%m/%d")

    -- Expanded list of famous quotes with attribution
    local quotes = {
      { text = "Amateurs hack computers; professionals hack people.", author = "Bruce Schneier" },
      { text = "The quieter you become, the more you are able to hear.", author = "Kali Linux" },
      { text = "Hackers are today's samurai, testing security and integrity.", author = "Jeff Moss" },
      { text = "The computer was born to solve problems that did not exist before.", author = "Bill Gates" },
      { text = "Two types of companies: those hacked, and those that will be.", author = "Robert Mueller" },
      { text = "The best way to predict the future is to invent it.", author = "Alan Kay" },
      { text = "Any sufficiently advanced technology is indistinguishable from magic.", author = "Arthur C. Clarke" },
      {
        text = "If you think technology can solve your problems, you don’t understand technology or your problems.",
        author = "Bruce Schneier",
      },
      {
        text = "The Internet is the first thing that humanity has built that humanity doesn’t understand.",
        author = "Eric Schmidt",
      },
      {
        text = "Privacy is not an option, and it shouldn't be the price we accept for just getting on the Internet.",
        author = "Gary Kovacs",
      },
      { text = "With great power comes great responsibility.", author = "Uncle Ben" },
      { text = "The art of security is to reduce risk while enabling business goals.", author = "Anonymous" },
      { text = "Stay paranoid and you’ll stay safe.", author = "Anonymous" },
      { text = "The more you know, the more you realize you know nothing.", author = "Socrates" },
      { text = "Security is not a product, but a process.", author = "Bruce Schneier" },
      {
        text = "A computer is like air conditioning - it becomes useless when you open Windows.",
        author = "Linus Torvalds",
      },
      {
        text = "We are stuck with technology when what we really want is just stuff that works.",
        author = "Douglas Adams",
      },
      { text = "Only amateurs attack machines; professionals target people.", author = "Anonymous" },
      { text = "First rule of hacking: don't talk about hacking.", author = "Anonymous" },
      { text = "You are your own worst enemy.", author = "Anonymous" },
    }

    -- Pick a random quote
    local selected_quote = quotes[math.random(#quotes)]
    local quote_text = selected_quote.text
    local quote_author = "- " .. selected_quote.author .. " -"

    return { date, "", quote_text, quote_author }
  end,
  fold_section = false,
  title = "Quote of the Day",
  margin = 5,
  highlight = "Constant",
  default_color = "#98c379",
}

startup.parts = { "header", "menu", "footer" }

return startup
