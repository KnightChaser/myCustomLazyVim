-- ~/.config/nvim/lua/plugins/neogen.lua
return {
  "danymat/neogen",
  config = function()
    require("neogen").setup({
      snippet_engine = "luasnip", -- Optional: Set your preferred snippet engine
      languages = {
        c = { template = { annotation_convention = "doxygen" } },
        go = { template = { annotation_convention = "godoc" } },
        python = { template = { annotation_convention = "google_docstrings" } },
      },
    })
  end,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
}
