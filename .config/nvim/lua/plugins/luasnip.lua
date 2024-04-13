local M = {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
}

function M.config()
  require("luasnip.loaders.from_vscode").lazy_load()
  require("luasnip").config.set_config({
    region_check_events = "InsertEnter",
    delete_check_events = "InsertLeave",
  })
end

return M
