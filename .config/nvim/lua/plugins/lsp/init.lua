local M = {
  'neovim/nvim-lspconfig',
  event = "BufReadPre",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'williamboman/mason.nvim'
  }
}

function M.config()
  require('mason')
  require('plugins.lsp.diagnostics').setup()

  local function on_attach(client, bufnr)
    require('nvim-navic').attach(client, bufnr)
    vim.api.nvim_set_option_value('signcolumn', 'yes', { scope = 'local' })
  end

  local servers = {
    tsserver = {},
    clangd = {},
    omnisharp = {},
    rust_analyzer = {},
    pyright = {},
    prismals = {},
    sumneko_lua = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        diagnostics = { globals = {'vim'} },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        telemetry = { enable = false },
      },
    }
  }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local options = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    for server, opts in pairs(servers) do
      opts = vim.tbl_deep_extend('force', {}, options, opts or {})
      require('lspconfig')[server].setup(opts)
    end

    require('plugins.null-ls').setup(options)
    require('plugins.lsp.keymap').setup()
end

return M
