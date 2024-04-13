local M = {
  "stevearc/conform.nvim",
  event = "BufEnter",
  opts = {
    formatters_by_ft = {
      python = { "isort", "black" },
      javascript = { "biome", },
      typescript = { "biome", },
      -- svelte = { "prettierd" },
      sql = { "sqlfluff" },
      json = { "biome" }
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    ["_"] = { "trim_whitespace" },
  },
  dependencies = {
    'williamboman/mason.nvim',
  }
}

return M
