-- ~/.config/nvim/init.lua
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.keymaps")
require("config.options")

vim.cmd[[colorscheme tokyonight-night]]

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    local shutdown_time = os.time()
    local file = io.open(vim.fn.stdpath("data") .. "/last_shutdown.txt", "w")
    file:write(shutdown_time)
    file:close()
  end,
})
