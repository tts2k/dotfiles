local M = {
  'neovim/nvim-lspconfig',
  event = "BufReadPre",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'williamboman/mason.nvim',
    {
      '~whynothugo/lsp_lines.nvim',
      url = 'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
      config = true
    },
    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim" }
    },
  },
  keys = require('plugins.lsp.keymap')
}

local initInlayHintsAutoCmd = function(client, bufnr)
  vim.api.nvim_create_augroup("lsp_augroup", { clear = true })

  vim.api.nvim_create_autocmd("InsertEnter", {
    buffer = bufnr,
    callback = function() vim.lsp.inlay_hint(bufnr, true) end,
    group = "lsp_augroup"
  })
  vim.api.nvim_create_autocmd("InsertLeave", {
    buffer = bufnr,
    callback = function() vim.lsp.inlay_hint(bufnr, false) end,
    group = "lsp_augroup"
  })
end

function M.config()
  require('mason')
  require('plugins.lsp.diagnostics').setup()

  local function on_attach(client, bufnr)
    require('nvim-navic').attach(client, bufnr)
    vim.api.nvim_set_option_value('signcolumn', 'yes', { scope = 'local' })
    initInlayHintsAutoCmd(client, bufnr)
  end

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
    taplo = {},
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

  require('plugins.null-ls').setup(options)
end

return M
