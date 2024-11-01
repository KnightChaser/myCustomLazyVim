# myCustomLazyVim

### PREVIEW
![image](https://github.com/user-attachments/assets/275b6fec-917e-4745-88e3-c42a247259c7)
![image](https://github.com/user-attachments/assets/29d6bd5b-8db4-499e-af10-f84ba1401a86)


### PROCEDURE

1. Using `bob`(https://github.com/MordechaiHadad/bob) package, Install the latest neovim(`nvim`) on your Ubuntu Linux(Installing `nightly` is encouraged).
   If you already installed the neovim with the appropriate version, you can skip it

2. Backup the previous neovim configuration
```bash
# required
mv ~/.config/nvim{,.backup}

# optional but recommended
mv ~/.local/share/nvim{,.backup}
mv ~/.local/state/nvim{,.backup}
mv ~/.cache/nvim{,.backup}
```
3. Git clone this repository(`KnightChaser/myCustomLazyVim`) to the neovim configuration.
```bash
git clone https://github.com/KnightChaser/myCustomLazyVim ~/.config/nvim
```

4. Execute neovim(`nvim`). Hit `:Lazy sync` to synchronize the packages. After, the neovim will be ready to use!


### Note
1. This neovim configuration also has LSP(Language Server Protocol)-related setup.
   For proper syntax highlighting and assistance(Intellisense), proper packages must be installed.
   For example, if you want to use C language IntelliSense, required packages(`clangd` and `llvm` via `apt-get`) must be installed.
   And, lua configuration(**`lua/plugins/mason.lua`**) must be adjusted. Basically, the file configuration is support C language(`clangd`) and Python(`pyright`).
   Refer to https://github.com/neovim/nvim-lspconfig for more information.
```lua
-- ~/.config/nvim/lua/plugins/mason.lua

return {
  -- Mason: Manage external editor tooling (LSP servers, DAP servers, linters, and formatters)
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  -- Mason-LSPConfig: Bridge between mason and lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "pyright" }, -- Added "pyright" here
      })
    end,
  },
}
```
2.  This setup also includes WakaTime extension. Visit https://wakatime.com/neovim for API key setup and more information.
    If you don't use WakaTime, you can simply ignore this setup and nothing will be happened.
