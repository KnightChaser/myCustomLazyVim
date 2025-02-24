-- ~/.config/nvim/lua/plugins/lualine.lua

-- Record the session start time
local session_start = os.time()

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional: for file icons
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "auto",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { "filename", "filesize" },
                lualine_x = { "encoding", "fileformat", "filetype", "hostname" },
                lualine_y = { "progress", "location" },
                lualine_z = {
                    function()
                        -- Get the current time string
                        local current_time = os.date("%Y/%m/%d %H:%M:%S")
                        -- Calculate elapsed seconds since session_start
                        local elapsed = os.time() - session_start
                        local session_time

                        if elapsed < 60 then
                            -- Format: "1s" to "59s"
                            session_time = string.format("%ds", elapsed)
                        elseif elapsed < 3600 then
                            -- Format: "1m00s" to "59m59s"
                            local m = math.floor(elapsed / 60)
                            local s = elapsed % 60
                            session_time = string.format("%dm %02ds", m, s)
                        else
                            -- Format: "1h00m00s" to "(infty)h59m59s"
                            local h = math.floor(elapsed / 3600)
                            local rem = elapsed % 3600
                            local m = math.floor(rem / 60)
                            local s = rem % 60
                            session_time = string.format("%dh %02dm %02ds", h, m, s)
                        end

                        -- Return current time and session uptime
                        return string.format("%s (session: %s)", current_time, session_time)
                    end,
                    "searchcount",
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = {},
        })
    end,
}
