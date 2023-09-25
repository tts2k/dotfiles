local M = {
  'neovim/nvim-lspconfig',
  event = "BufReadPre",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'williamboman/mason.nvim',
    {
      '~whynothugo/lsp_lines.nvim',
      url = 'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
      opts = {}
    },
    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
      "SmiteshP/nvim-navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim"
      },
      opts = { lsp = { auto_attach = true } }
    },
  },
  keys = require('plugins.lsp.keymap')
}

function M.config()
  require('mason')
  require('plugins.lsp.diagnostics').setup()

  local servers = {
    clangd = {},
    omnisharp = {},
    rust_analyzer = {},
    pyright = {},
    prismals = {},
    bashls = {},
    gopls = require('go.lsp').config(),
    svelte = {},
    tailwindcss = {},
    html = {},
    jsonls = {},
    lua_ls = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        diagnostics = { globals = { 'vim' } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        telemetry = { enable = false },
        hint = { enable = true }
      },
    }
  }

  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  local options = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  for server, opts in pairs(servers) do
    opts = vim.tbl_deep_extend('force', {}, options, opts or {})
    require('lspconfig')[server].setup(opts)
  end

  require("typescript-tools").setup({
    on_attach = on_attach,
    settings = {
      completions = {
        completeFunctionCalls = true
      },
      tsserver_file_preferences = {
        includeInlayParameterNameHints = "all",
        includeInlayVariableTypeHints = true,
        includeCompletionsForModuleExports = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
        quotePreference = "auto",
      }
    }
  })
end

return M
