---@diagnostic disable: undefined-global
--Basic Settigns

vim.g.formatoptions = "grn1"
vim.opt.showmode = false
vim.opt.updatetime = 100
vim.wo.signcolumn = "yes"
vim.opt.wrap = false
vim.wo.linebreak = true
vim.opt.virtualedit = 'block'
vim.opt.undofile = true
vim.opt.shell = "/bin/fish"
vim.opt.swapfile = false
vim.opt.encoding = "utf-8"
vim.opt.cursorline = true
vim.opt.fileformat = "unix"


--Nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

--Scroll
vim.opt.so = 30

--Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

--Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.wo.number = true
vim.wo.relativenumber = true

--Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

--Clipboard
vim.opt.clipboard = "unnamedplus"

-- Shorter messages
vim.opt.shortmess:append("c")

--Indent Settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.smarttab = true


vim.cmd([[highlight clear LineNr]])
vim.cmd([[highlight clear SignColumn]])


---Keymaps

vim.g.mapleader = " "

-->Quit
vim.keymap.set('n', '<leader>q', '<cmd>:q<CR>')

--Copy all text
vim.keymap.set('n', '<C-a>', '<cmd>%y+<CR>')

--Saving a file with ctrl+S
vim.keymap.set('i', '<C-s>', '<cmd>:w<CR>')
vim.keymap.set('n', '<C-s>', '<cmd>:w<CR>')

---NvimTree 
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<C-f>', ':NvimTreeFocus<CR>')

---BufferLine
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<C-b>', ':BufferLineCloseOthers<CR>')

-- illuminate
vim.keymap.set('n', '<leader>t', ':IlluminateToggle<CR>')
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
