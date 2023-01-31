local M = {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'haydenmeade/neotest-jest'
  }
}

function M.config()
  local jest_adapter = require('neotest-jest')({
    jestCommand = "npm test --",
    jestConfigFile = "custom.jest.config.ts",
    env = { CI = true },
    cwd = function(path)
      return vim.fn.getcwd()
    end,
  })

  require('neotest').setup({
    adapters = {
      jest_adapter
    }
  })
end

return M
