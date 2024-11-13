-- ~/.config/nvim/lua/plugins/render-markdown.lua
return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {
        enabled = true,
        max_file_size = 10.0, -- maximum file size (in MB)
        preset = "lazy",
        file_types = { "markdown" },
        render_modes = { "n", "c" },
        heading = {
            enabled = true,
            sign = true,
            icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
            backgrounds = {
                "RenderMarkdownH1Bg",
                "RenderMarkdownH2Bg",
                "RenderMarkdownH3Bg",
                "RenderMarkdownH4Bg",
                "RenderMarkdownH5Bg",
                "RenderMarkdownH6Bg",
            },
            foregrounds = {
                "RenderMarkdownH1",
                "RenderMarkdownH2",
                "RenderMarkdownH3",
                "RenderMarkdownH4",
                "RenderMarkdownH5",
                "RenderMarkdownH6",
            },
        },
        dash = {
            enabled = true,
            icon = "─",
            width = "full",
            highlight = "RenderMarkdownDash",
        },
        bullet = {
            enabled = true,
            icons = { "●", "○", "◆", "◇" },
            highlight = "RenderMarkdownBullet",
        },
        checkbox = {
            enabled = true,
            unchecked = { icon = "󰄱 ", highlight = "RenderMarkdownUnchecked" },
            checked = { icon = "󰱒 ", highlight = "RenderMarkdownChecked" },
        },
        quote = {
            enabled = true,
            icon = "▋",
            highlight = "RenderMarkdownQuote",
        },
        pipe_table = {
            enabled = true,
            style = "full",
            padding = 1,
            border = {
                "┌", "┬", "┐",
                "├", "┼", "┤",
                "└", "┴", "┘",
                "│", "─",
            },
            head = "RenderMarkdownTableHead",
            row = "RenderMarkdownTableRow",
        },
        link = {
            enabled = true,
            image = "󰥶 ",
            email = "󰀓 ",
            hyperlink = "󰌹 ",
            highlight = "RenderMarkdownLink",
        },
        win_options = {
            conceallevel = { default = vim.o.conceallevel, rendered = 3 },
            concealcursor = { default = vim.o.concealcursor, rendered = "" },
        },
    },
}

