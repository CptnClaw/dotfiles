vim.cmd('source ~/.vimrc')

require("toggleterm").setup{}

local colorschemes = vim.fn.getcompletion("", "color")
local colorschemes_idx = vim.fn.index(
    colorschemes,
    vim.api.nvim_cmd({ cmd = "colorscheme" }, { output = true })
)

local function change_colorscheme(forward)
    if forward then
        colorschemes_idx = colorschemes_idx + 1
    else
        colorschemes_idx = colorschemes_idx - 1
    end

    if colorschemes_idx > #colorschemes then
        colorschemes_idx = 1
    elseif colorschemes_idx < 1 then
        colorschemes_idx = #colorschemes
    end

    local ok = pcall(function()
        vim.cmd("colorscheme " .. colorschemes[colorschemes_idx])
    end)

    if not ok then
        change_colorscheme(forward)
    end

    print(colorschemes[colorschemes_idx])
end

vim.keymap.set("n", "<C-c>h", function()
    change_colorscheme(true)
end)

vim.keymap.set("n", "<C-c>l", function()
    change_colorscheme(false)
end)
