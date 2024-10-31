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
      -- For example, using LuaSnip:
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    -- Add more key mappings if desired
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    -- Add other sources like buffer, path, etc.
  },
})

-- Setup for specific filetypes if needed
-- Example for command-line:
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "cmdline" },
  },
})
