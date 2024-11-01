# myCustomLazyVim

### PROCEDURE

1. Using `bob`(https://github.com/MordechaiHadad/bob) package, Install the latest neovim(`nvim`) on your Ubuntu Linux(Installing `nightly` is encouraged).
   If you already installed the neovim with appropriate version, you can skip it

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
![image](https://github.com/user-attachments/assets/f3fbffea-2db9-4ad1-ae7c-1a18714cd6f6)
