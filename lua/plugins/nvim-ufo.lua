-- ~/.config/lua/plugins/nvim-ufo.lua

return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  config = function()
    -- Basic fold settings for nvim-ufo
    vim.o.foldcolumn = "1"      -- Show a fold column
    vim.o.foldlevel = 99        -- Start with folds open
    vim.o.foldlevelstart = 99   -- Ditto
    vim.o.foldenable = true     -- Enable folding

    -- Setup nvim-ufo with an optional provider configuration
    require("ufo").setup({
      provider_selector = function(bufnr, filetype, buftype)
        return {"lsp", "indent"}  -- Try LSP first, fallback to indent-based folding
      end,
    })

    -- Global keymaps for operating on all folds in the buffer
    vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })

    -- Toggle fold under cursor using a single keymap:
    vim.keymap.set("n", "za", function()
      -- Check if the fold under the cursor is closed:
      if vim.fn.foldclosed(".") ~= -1 then
        vim.cmd("normal! zo")  -- Open the fold if it's closed
      else
        vim.cmd("normal! zc")  -- Otherwise, close it
      end
    end, { desc = "Toggle fold under cursor" })
  end,
}
