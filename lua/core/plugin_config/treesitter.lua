require('nvim-treesitter').setup({
  ensure_installed = { "c", "lua", "vim", "python" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
})
