-- ~/.config/nvim/lua/plugins/hexer.lua

return {
    "theKnightsOfRohan/hexer.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("hexer").setup()
    end,
}
