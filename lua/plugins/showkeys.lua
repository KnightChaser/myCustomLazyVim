-- ~/.config/nvim/lua/plugins/showkeys.lua
return {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    event = "VeryLazy", -- Load the plugin automatically on startup
    opts = {
        timeout = 1,
        maxkeys = 3,
        show_count = true,
        keyformat = {
            ["<BS>"] = "󰁮 ",
            ["<CR>"] = "󰘌",
            ["<Space>"] = "󱁐",
            ["<Up>"] = "󰁝",
            ["<Down>"] = "󰁅",
            ["<Left>"] = "󰁍",
            ["<Right>"] = "󰁔",
            ["<PageUp>"] = "Page 󰁝",
            ["<PageDown>"] = "Page 󰁅",
            ["<M>"] = "Alt",
            ["<C>"] = "Ctrl",
        },
    },
    -- Enable the plugin on startup if you just want.
    -- config = function(_, opts)
    --     require("showkeys").setup(opts)
    --     vim.cmd("ShowkeysToggle") -- Automatically toggle on startup
    -- end,
}
