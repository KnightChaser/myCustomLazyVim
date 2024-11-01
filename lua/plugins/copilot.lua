return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = false,       -- Keeps suggestions off until manually triggered
      debounce = 75,
      hide_during_completion = true,
      keymap = {
        accept = "<Down>",        -- Accept suggestion with Down arrow
        next = "<M-]>",           -- Move to the next suggestion
        prev = "<M-[>",           -- Move to the previous suggestion
        dismiss = "<C-]>",        -- Dismiss the current suggestion
      },
    },
    panel = {
      enabled = true,             -- Allows viewing suggestions in a split window
      keymap = {
        open = "<M-CR>",          -- Opens panel with Alt + Enter
        refresh = "gr",           -- Refresh suggestions
        jump_next = "]]",         -- Jump to next suggestion in the panel
        jump_prev = "[[",         -- Jump to previous suggestion
      },
      layout = {
        position = "bottom",
        ratio = 0.4,
      },
    },
    filetypes = {
      markdown = true,
      help = true,
      -- Add more specific filetypes here if needed
    },
  },
}
