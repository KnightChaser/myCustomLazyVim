-- ~/.config/nvim/lua/config/cmp.lua

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    -- Pressing Enter inserts a new line without confirming completion
    ["<CR>"] = function(fallback)
      fallback()
    end,
    -- Pressing Tab confirms the selected completion or inserts a tab
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })
      else
        fallback()
      end
    end, { "i", "s" }),
    -- Navigate completion items
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    -- Abort completion
    ["<C-e>"] = cmp.mapping.abort(),
    -- Optional: Keep Ctrl-y for confirmation
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = "copilot" }, -- Copilot as a source
    { name = "nvim_lsp" }, -- LSP source
    { name = "luasnip" }, -- Snippets
    { name = "buffer" }, -- Buffer source
    { name = "path" }, -- Path source
    -- Add other sources if needed
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    -- Customize the formatting of completion items if desired
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local menu_icons = {
        copilot = "",
        nvim_lsp = "λ",
        luasnip = "⋗",
        buffer = "Ω",
        path = "",
      }
      vim_item.menu = menu_icons[entry.source.name] or ""
      return vim_item
    end,
  },
})

-- Setup for specific filetypes if needed
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "cmdline" },
  },
})
