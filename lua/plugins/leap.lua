-- ~/.config/nvim/lua/plugins/leap.lua

return {
    "ggandor/leap.nvim",
    config = function()
        -- Set up the default mappings (skipped because we are manually setting them below(overriding))
        -- require("leap").create_default_mappings()

        -- Now override any mapping that conflicts
        -- For instance, if you want to change the mapping for 's':
        vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)", { desc = "Custom Leap Forward" })
        -- You can also override other mappings similarly:
        vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)", { desc = "Custom Leap Backward" })
        vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)", { desc = "Custom Leap from Window" })
    end,
}
