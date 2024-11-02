-- ~/.config/nvim/lua/plugins.lua

return {
  -- nvim-cmp and its dependencies
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      -- Copilot and its cmp integration
      {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
          panel = {
            enabled = true,
            auto_refresh = false,
            keymap = {
              jump_prev = "[[",
              jump_next = "]]",
              accept = "<Tab>", -- Changed from <CR> to <Tab>
              refresh = "gr",
              open = "<M-CR>",
            },
            layout = {
              position = "bottom",
              ratio = 0.4,
            },
          },
          suggestion = {
            enabled = true,
            auto_trigger = false,
            hide_during_completion = true,
            debounce = 75,
            keymap = {
              accept = "<Tab>", -- Changed from <M-l> to <Tab>
              accept_word = false,
              accept_line = false,
              next = "<M-]>",
              prev = "<M-[>",
              dismiss = "<C-]>",
            },
          },
          filetypes = {
            yaml = false,
            markdown = false,
            help = false,
            gitcommit = false,
            gitrebase = false,
            hgcommit = false,
            svn = false,
            cvs = false,
            ["."] = false,
          },
          copilot_node_command = "node", -- Ensure Node.js is >= 18.x
          server_opts_overrides = {},
        },
      },
      {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua", "nvim-cmp" },
        dependencies = { "zbirenbaum/copilot.lua", "hrsh7th/nvim-cmp" },
        config = function()
          require("config.copilot-cmp")
        end,
      },
    },
    config = function()
      -- Load your cmp configuration
      require("config.cmp")
    end,
  },

  -- LuaSnip configuration (optional, if not already set)
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip").setup({
        -- Your LuaSnip configurations
      })
    end,
  },

  -- Add any other plugins here
}
