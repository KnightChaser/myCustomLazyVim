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
    name = "  Open in terminal",
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
}

