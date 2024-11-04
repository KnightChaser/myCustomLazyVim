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

-- System Information Section
startup.system_info = {
  type = "text",
  align = "center",
  content = function()
    local nvim_version = "Neovim: " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
    local os_info = "OS: " .. vim.loop.os_uname().sysname .. " " .. vim.loop.os_uname().release

    -- Load last shutdown time
    local last_shutdown_file = vim.fn.stdpath("data") .. "/last_shutdown.txt"
    local last_shutdown_time
    local file = io.open(last_shutdown_file, "r")
    if file then
      last_shutdown_time = tonumber(file:read("*a"))
      file:close()
    end

    local last_used = last_shutdown_time and os.date("%Y/%m/%d %H:%M:%S", last_shutdown_time) or "N/A"
    local time_elapsed = last_shutdown_time and os.difftime(os.time(), last_shutdown_time) or 0

    local days = math.floor(time_elapsed / 86400)
    local hours = math.floor((time_elapsed % 86400) / 3600)
    local minutes = math.floor((time_elapsed % 3600) / 60)
    local seconds = math.floor(time_elapsed % 60)

    local elapsed_text =
      string.format("Last used: %s (Elapsed: %dd %dh %dm %ds)", last_used, days, hours, minutes, seconds)

    return { nvim_version, os_info, elapsed_text }
  end,
  fold_section = false,
  title = "System Info",
  margin = 5,
  highlight = "Function",
  default_color = "#e5c07b",
}

-- Footer Section with Date, Time, and Random Quote
startup.footer = {
  type = "text",
  align = "center",
  content = function()
    local date = " " .. os.date("%Y/%m/%d")

    -- Expanded list of hacking and cybersecurity-related quotes with attribution
    local quotes = {
      { text = "Security is not a product, but a process.", author = "Bruce Schneier" },
      {
        text = "There is no such thing as a secure system, only systems that are secure enough.",
        author = "Bruce Schneier",
      },
      { text = "Hackers are not just criminals; they are also innovators.", author = "Anonymous" },
      { text = "In the world of cybersecurity, the adversary is always trying to outsmart us.", author = "Anonymous" },
      { text = "Cybersecurity is much more than a matter of IT.", author = "Stephane Nappo" },
      { text = "It's not if, it's when.", author = "Anonymous" },
      { text = "Hacking is not a crime. It’s a way of thinking.", author = "Anonymous" },
      { text = "An ounce of prevention is worth a pound of cure.", author = "Benjamin Franklin" },
      { text = "The best defense is a good offense.", author = "Anonymous" },
      { text = "To err is human, to forgive is not in cybersecurity.", author = "Anonymous" },
      { text = "Data is the new oil, and cybersecurity is the refinery.", author = "Anonymous" },
      {
        text = "There are two types of companies: those that have been hacked, and those that will be.",
        author = "Robert Mueller",
      },
      {
        text = "If you think technology can solve your security problems, then you don’t understand technology or your security problems.",
        author = "Bruce Schneier",
      },
      {
        text = "The more you know about a potential attacker, the better you can protect against them.",
        author = "Anonymous",
      },
      { text = "A chain is only as strong as its weakest link.", author = "Proverb" },
      {
        text = "In cybersecurity, the battle is between the attacker and defender, and it's a constant arms race.",
        author = "Anonymous",
      },
      { text = "Your security is only as strong as your weakest password.", author = "Anonymous" },
      {
        text = "The hacker mindset doesn't actually see what happens on the other side, it just exploits what you can see.",
        author = "Anonymous",
      },
      { text = "Cybersecurity is a shared responsibility, not just the IT department’s.", author = "Anonymous" },
      {
        text = "The Internet is the first thing that humanity has built that humanity doesn’t understand, the largest experiment in anarchy that we have ever had.",
        author = "Eric Schmidt",
      },
      {
        text = "The problem with the digital world is not that it's broken; it's that it's being constantly broken.",
        author = "Kevin Mitnick",
      },
      { text = "A security breach is not the end; it's the beginning of better security.", author = "Anonymous" },
      { text = "Security is about understanding the threats and mitigating the risks.", author = "Anonymous" },
      { text = "The more you know, the more you realize you know nothing.", author = "Socrates" },
      { text = "Stay paranoid and you’ll stay safe.", author = "Anonymous" },
      {
        text = "Privacy is not an option, and it shouldn't be the price we accept for just getting on the Internet.",
        author = "Gary Kovacs",
      },
      { text = "With great power comes great responsibility.", author = "Uncle Ben" },
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

startup.parts = { "header", "system_info", "menu", "footer" }

return startup
