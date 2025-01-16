-- ~/.config/nvim/lua/custom_extensions/uuidv4.lua

local M = {}

-- Function to generate a random UUIDv4
function M.generate_uuid()
    local random = math.random
    local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
    return string.gsub(template, "[xy]", function(c)
        local v = (c == "x") and random(0, 15) or random(8, 11)
        return string.format("%x", v)
    end)
end

-- Function to insert UUID into the current buffer
function M.uuid_to_buffer()
    local uuid = M.generate_uuid()
    vim.api.nvim_put({ uuid }, "c", true, true)
    vim.notify("UUID inserted into buffer: " .. uuid)
end

-- Function to copy UUID to the clipboard
function M.uuid_to_clipboard()
    local uuid = M.generate_uuid()
    vim.fn.setreg("+", uuid)
    vim.notify("UUID copied to clipboard: " .. uuid)
end

-- Create user commands
vim.api.nvim_create_user_command(
    "UUIDv4ToBuffer",
    M.uuid_to_buffer,
    { desc = "Insert a random UUIDv4 into the buffer" }
)

vim.api.nvim_create_user_command(
    "UUIDv4ToClipboard",
    M.uuid_to_clipboard,
    { desc = "Copy a random UUIDv4 to the clipboard" }
)

return M
