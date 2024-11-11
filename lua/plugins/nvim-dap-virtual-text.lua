-- ~/.config/nvim/lua/nvim-dap-virtual-text.lua
return {
    "theHamsta/nvim-dap-virtual-text",
    depends = { "theHamsta/nvim-dap-virtual-text" },
    config = function()
        require("nvim-dap-virtual-text").setup {
            comment = true,
        }
    end,
}
