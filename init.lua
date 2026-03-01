require("core.keymaps")
require("core.plugins")

-- Plugin configs are loaded only after lazy has set up all plugins
-- On first launch lazy will install plugins and restart is needed
local ok, err = pcall(require, "core.plugin_config")
if not ok then
  vim.notify("Plugin config error (plugins may not be installed yet): " .. err, vim.log.levels.WARN)
end
