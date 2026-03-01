-- Patch ft_to_lang immediately before telescope loads its previewers
if vim.treesitter.language.ft_to_lang == nil then
  vim.treesitter.language.ft_to_lang = function(ft)
    local ok, lang = pcall(vim.treesitter.language.get_lang, ft)
    return ok and lang or ft
  end
end

require('telescope').setup({
  defaults = {
    preview = {
      treesitter = false, -- disable treesitter highlighting in previewer to avoid ft_to_lang crash
    },
  },
})

vim.keymap.set('n', '<c-p>', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<Space><Space>', require('telescope.builtin').oldfiles, {})
vim.keymap.set('n', '<Space>fg', require('telescope.builtin').live_grep, {})
vim.keymap.set('n', '<Space>fh', require('telescope.builtin').help_tags, {})

---Git
vim.keymap.set('n', '<leader>gb', require('telescope.builtin').git_branches, {})
vim.keymap.set('n', '<leader>gc', require('telescope.builtin').git_commits, {})
vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status, {})

vim.keymap.set('n', '<leader>cs', require('telescope.builtin').colorscheme, {})
