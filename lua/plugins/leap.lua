-- ~/.config/nvim/lua/plugins/leap.lua

return {
    "ggandor/leap.nvim",
    config = function()
        -- Set up the default mappings:
        -- This creates mappings for 's', 'S', and 'gs' in Normal, Visual, and Operator-pending modes.
        require("leap").create_default_mappings()

        -- Additional tweaks for a smoother experience:

        -- This helps leap treat, say, different types of quotes or brackets similarly.
        require("leap").opts.equivalence_classes = { " \t\r\n", "([{", ")]}", "'\"`" }
        -- Here, <enter> moves to the next available target and <backspace> goes back.
        require("leap.user").set_repeat_keys("<enter>", "<backspace>")

        -- This allows you to jump to a target even in another window (a “spooky action at a distance”).
        vim.keymap.set({ "n", "x", "o" }, "gs", function()
            require("leap.remote").action()
        end, { desc = "Leap remote action" })

        vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
        vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')
        vim.keymap.set({ 'n', 'x', 'o' }, 'gs', '<Plug>(leap-from-window)')
    end,
}
