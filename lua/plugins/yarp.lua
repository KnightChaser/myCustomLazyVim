-- ~/.config/nvim/lua/plugins/yarp.lua
return {
    {
        "roxma/nvim-yarp",
        build = "pip3 install pynvim", -- Install Python dependency
        dependencies = { "roxma/vim-hug-neovim-rpc" },
        config = function()
            -- Add any specific configuration if needed
        end,
    },
    {
        "roxma/vim-hug-neovim-rpc", -- Dependency for Vim 8 support
    },
}

