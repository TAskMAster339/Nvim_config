vim.o.termguicolors = true
function SetColor()
    ---Option 1
    ---vim.cmd [[ colorscheme gruvbox ]]

    ---Option 2
    vim.cmd [[colorscheme tokyonight-storm]]
end

SetColor()
