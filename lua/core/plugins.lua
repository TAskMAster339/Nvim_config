-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  --- Colorscheme
  { "ellisonleao/gruvbox.nvim", lazy = true },
  { "folke/tokyonight.nvim",   lazy = true },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("core.plugin_config.gruvbox")
    end,
  },

  --- File tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("core.plugin_config.nvim-tree")
    end,
  },

  --- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("core.plugin_config.lualine")
    end,
  },

  --- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("core.plugin_config.treesitter")
    end,
  },

  --- LSP / Mason
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("core.plugin_config.lsp_config")
    end,
  },

  --- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("core.plugin_config.completions")
    end,
  },

  --- Bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("core.plugin_config.buffer")
    end,
  },

  --- Todo comments
  {
    "folke/todo-comments.nvim",
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("core.plugin_config.todo")
    end,
  },

  --- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("core.plugin_config.telescope")
    end,
  },

  --- Auto pairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("core.plugin_config.autopairs")
    end,
  },

  --- Comments
  {
    "numToStr/Comment.nvim",
    config = function()
      require("core.plugin_config.comment")
    end,
  },

  --- Highlighting
  {
    "RRethy/vim-illuminate",
    config = function()
      require("core.plugin_config.illuminate")
    end,
  },

  --- Better escape
  {
    "max397574/better-escape.nvim",
    config = function()
      require("core.plugin_config.better-escape")
    end,
  },
}, {
  ui = { border = "rounded" },
})
