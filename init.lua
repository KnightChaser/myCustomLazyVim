-- ~/.config/nvim/init.lua
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.keymaps")
require("config.options")

-- Enable LazyVim extras, including coding.nvim-cmp
require("lazyvim").setup({
  extras = {
    "coding.nvim-cmp", -- Enables nvim-cmp support
  },
})

-- Set colorscheme
vim.cmd([[colorscheme tokyonight-night]])

-- Save shutdown time
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    local shutdown_time = os.time()
    local file = io.open(vim.fn.stdpath("data") .. "/last_shutdown.txt", "w")
    if file then
      file:write(shutdown_time)
      file:close()
    end
  end,
})

