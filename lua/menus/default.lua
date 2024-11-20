-- ~/.config/nvim/lua/menus/default.lua

return {
  -- Toggle NvimTree
  {
    name = "Toggle NvimTree",
    cmd = function()
      vim.cmd "NvimTreeToggle"
    end,
    rtxt = "<leader>nt",
  },

  -- Create a New Tab
  {
    name = "New Tab",
    cmd = function()
      vim.cmd "tabnew"
    end,
    rtxt = "tn",
  },

  -- New File
  {
    name = "New File",
    cmd = function()
      vim.cmd "enew"
    end,
    rtxt = "<leader>nf",
  },

  -- Separator
  { name = "separator" },

  -- Copy Current Line
  {
    name = "Copy Line",
    cmd = function()
      vim.cmd "yyl"
    end,
    rtxt = "<leader>cl",
  },

  -- Delete Current Line
  {
    name = "Delete Line",
    cmd = function()
      vim.cmd "dyl"
    end,
    rtxt = "<leader>dl",
  },

  -- Separator
  { name = "separator" },

  -- Open in Terminal (Maintained)
  {
    name = "  Open in Terminal",
    hl = "ExRed",
    cmd = function()
      local old_buf = require("menu.state").old_data.buf
      local old_bufname = vim.api.nvim_buf_get_name(old_buf)
      local old_buf_dir = vim.fn.fnamemodify(old_bufname, ":h")

      local cmd = "cd " .. old_buf_dir

      -- base46_cache var is an indicator of nvui user!
      if vim.g.base46_cache then
        require("nvchad.term").new { cmd = cmd, pos = "sp" }
      else
        vim.cmd "enew"
        vim.fn.termopen { vim.o.shell, "-c", cmd .. " ; " .. vim.o.shell }
      end
    end,
  },

  -- Separator
  { name = "separator" },

  -- Color Picker (Maintained)
  {
    name = "  Color Picker",
    cmd = function()
      require("minty.huefy").open()
    end,
  },

  -- Separator
  { name = "separator" },

  -- Find Files using Telescope
  {
    name = "Find Files",
    cmd = function()
      require("telescope.builtin").find_files()
    end,
    rtxt = "<leader>ff",
  },

  -- Find Word using Telescope
  {
    name = "Find Word",
    cmd = function()
      require("telescope.builtin").live_grep()
    end,
    rtxt = "<leader>lg",
  },

  -- Recent Files using Telescope
  {
    name = "Recent Files",
    cmd = function()
      require("telescope.builtin").oldfiles()
    end,
    rtxt = "<leader>of",
  },

  -- File Browser using Telescope (assuming nvim-tree is not desired here)
  {
    name = "File Browser",
    cmd = function()
      require("telescope").extensions.file_browser.file_browser()
    end,
    rtxt = "<leader>fb",
  },

  -- Colorscheme Selector
  {
    name = "Colorscheme",
    cmd = function()
      vim.ui.select(vim.api.nvim_get_runtime_file("colors/*.vim", true), {
        prompt = "Select Colorscheme:",
        format_item = function(item)
          return vim.fn.fnamemodify(item, ":t:r")
        end,
      }, function(choice)
        if choice then
          vim.cmd("colorscheme " .. vim.fn.fnamemodify(choice, ":t:r"))
        end
      end)
    end,
    rtxt = "<leader>cs",
  },
}

