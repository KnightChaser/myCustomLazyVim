-- ~/.config/nvim/lua/plugins/remote-sshfs.lua
return {
    "nosduco/remote-sshfs.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {
        ssh_configs = {
            vim.fn.expand "$HOME" .. "/.ssh/config",
        },
    },
}
