-- Must be set before any plugin loads telescope previewers
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  once = true,
  callback = function()
    if vim.treesitter.language.ft_to_lang == nil then
      vim.treesitter.language.ft_to_lang = function(ft)
        local ok, lang = pcall(vim.treesitter.language.get_lang, ft)
        return ok and lang or ft
      end
    end
  end,
})

require("core.keymaps")
require("core.plugins")
