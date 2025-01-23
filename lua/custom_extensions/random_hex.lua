-- ~/.config/nvim/lua/custom_extensions/hexgen.lua

local M = {}

-- Seed the random number generator for better randomness
math.randomseed(os.time())

-- Function to generate a random hexadecimal string of specified length
function M.generate_hex(length)
    length = tonumber(length)
    if not length or length <= 0 then
        vim.notify("Invalid length for hexadecimal generation. Please provide a positive integer.", vim.log.levels.ERROR)
        return nil
    end

    local hex = {}
    for i = 1, length do
        local rand = math.random(0, 15)
        table.insert(hex, string.format("%x", rand))
    end
    return table.concat(hex)
end

-- Function to insert hex into the current buffer
function M.hex_to_buffer(opts)
    local length = opts.args and tonumber(opts.args) or 16  -- Default length is 16 if not specified
    local hex = M.generate_hex(length)
    if hex then
        vim.api.nvim_put({ hex }, "c", true, true)
        vim.notify(string.format("Hexadecimal (%d digits) copied to buffer.", length))
    end
end

-- Function to copy hex to the clipboard
function M.hex_to_clipboard(opts)
    local length = opts.args and tonumber(opts.args) or 16  -- Default length is 16 if not specified
    local hex = M.generate_hex(length)
    if hex then
        vim.fn.setreg("+", hex)
        vim.notify(string.format("Hexadecimal (%d digits) copied to clipboard.", length))
    end
end

-- Create user commands with optional length argument
vim.api.nvim_create_user_command(
    "HexGenToBuffer",
    M.hex_to_buffer,
    {
        nargs = "?",
        complete = "shellcmd",
        desc = "Insert a random hexadecimal number into the buffer. Usage: :HexGenToBuffer [length]",
    }
)

vim.api.nvim_create_user_command(
    "HexGenToClipboard",
    M.hex_to_clipboard,
    {
        nargs = "?",
        complete = "shellcmd",
        desc = "Copy a random hexadecimal number to the clipboard. Usage: :HexGenToClipboard [length]",
    }
)

return M

