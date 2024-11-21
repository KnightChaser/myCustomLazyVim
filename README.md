# myCustomLazyVim

### PREVIEW

![image](https://github.com/user-attachments/assets/4a16a324-c71a-4608-a66e-33264dc039c9)
![image](https://github.com/user-attachments/assets/2d555526-3c1f-40cd-ae8b-e33d5f7863e7)

### PROCEDURE

1. Using `bob`(<https://github.com/MordechaiHadad/bob>) package, Install the latest neovim(`nvim`) on your Ubuntu Linux(Installing `nightly` is encouraged).
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

1. Note that my setup includes some fancy icons as characters on the terminal, so it's required to install the **Nerd Fonts** font family at <https://www.nerdfonts.com/>. Download any font you want among that font family, and set the font to your terminal.

2. This neovim configuration also has LSP(Language Server Protocol)-related setup.
   For proper syntax highlighting and assistance(Intellisense), proper packages must be installed.
   For example, if you want to use C language IntelliSense, required packages(`clangd` and `llvm` via `apt-get`) must be installed.
   And, lua configuration(**`lua/plugins/mason.lua`**) must be adjusted. Basically, the file configuration is support C language(`clangd`) and Python(`pyright`).
   Refer to <https://github.com/neovim/nvim-lspconfig> for more information.

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

3. This setup also includes WakaTime extension. Visit <https://wakatime.com/neovim> for API key setup and more information.
    If you don't use WakaTime, you can simply ignore this setup and nothing will be happened.

4. For Markdown linting, see `./lua/plugins/render-markdown.lua`(You can just delete it away if you don't want.). Basically, it aesthetically reformats and shows up the formatted Markdown documents on the console. First, you have to install `markdownlint-cli2` via `brew`(homebrew). Refer to the following codes for installation

```bash
# Install homebrew(brew)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install markdownlint-cli2
brew install markdownlint-cli2
```

5. Always importantly, don't forget to issue `:checkhealth` and `:Mason` command if you encountered some errors! Especially if you just installed system, there might be some missing packages such as `curl`. Major external dependencies such as `node.js` are listed in `.mise.toml`. Install mise(<https://github.com/jdx/mise>) and manage external dependencies in a single shot.
