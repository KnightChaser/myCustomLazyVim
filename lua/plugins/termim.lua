-- ~/.config/nvim/lua/plugins/termim.lua
return {
    "2kabhishek/termim.nvim",
    cmd = { "Fterm", "FTerm", "Sterm", "STerm", "Vterm", "VTerm" },
    config = function()
        -- Set up key mappings using 'which-key'
        require("which-key").register({
            t = {
                name = "Terminal",
                ["`"] = { "<cmd>Sterm<cr>", "Horizontal Terminal" },
                e = { "<cmd>Sterm iex<cr>", "Elixir" },
                g = { "<cmd>Fterm lazygit<cr>", "Lazygit" },
                n = { "<cmd>Sterm node<cr>", "Node" },
                p = { "<cmd>Sterm bpython<cr>", "Python" },
                r = { "<cmd>Sterm irb<cr>", "Ruby" },
                s = { "<cmd>Sterm<cr>", "Horizontal Terminal" },
                t = { "<cmd>Fterm<cr>", "Terminal" },
                v = { "<cmd>Vterm<cr>", "Vertical Terminal" },
            },
        }, { prefix = "<leader>" })
    end,
}

