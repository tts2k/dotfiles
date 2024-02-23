local M = {
  "mfussenegger/nvim-lint",
  event = "BufEnter",
  opts = {
    linters_by_ft = {
      sql = { "sqlfluff" },
      javascript = { "eslint_d" },
      typescript = { "eslint_d " },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d " },
    },
    linters = {
      eslint_d = {
        args = {
          '--no-warn-ignored',
          'json',
          '--stdin',
          '--stdin-filename',
          function()
            return vim.api.nvim_buf_get_name(0)
          end,
        }
      }
    },
    dependencies = {
      'williamboman/mason.nvim',
    }
  }
}

function M.config()
  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
      require("lint").try_lint()
    end,
  })
end

return M
