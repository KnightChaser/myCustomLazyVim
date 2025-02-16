-- ~/.config/nvim/init.lua
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.keymaps")
require("config.options")
require("custom_extensions.uuidv4")
require("custom_extensions.random_hex")

-- Set colorscheme
vim.cmd([[colorscheme tokyonight-night]])

-- Blink cursor
vim.o.guicursor = table.concat({
    "n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
    "i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
    "r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100"
}, ",")


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
