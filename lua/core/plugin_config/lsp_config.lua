require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "clangd", "pyright" },
})

-- Keymaps applied when an LSP attaches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buf = args.buf
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,        { buffer = buf })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,   { buffer = buf })
    vim.keymap.set('n', 'gd',        vim.lsp.buf.definition,     { buffer = buf })
    vim.keymap.set('n', 'gi',        vim.lsp.buf.implementation, { buffer = buf })
    vim.keymap.set('n', 'gr',        require('telescope.builtin').lsp_references, { buffer = buf })
    vim.keymap.set('n', 'K',         vim.lsp.buf.hover,          { buffer = buf })
  end,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- New API: vim.lsp.config (nvim-lspconfig v3+)
vim.lsp.config('lua_ls',  { capabilities = capabilities })
vim.lsp.config('clangd',  { capabilities = capabilities })
vim.lsp.config('pyright', { capabilities = capabilities })

vim.lsp.enable({ 'lua_ls', 'clangd', 'pyright' })
