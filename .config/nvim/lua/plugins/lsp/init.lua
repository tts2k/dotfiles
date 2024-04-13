local M = {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    {
      "~whynothugo/lsp_lines.nvim",
      url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      opts = {},
    },
    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  keys = require("plugins.lsp.keymap"),
}

function M.config()
  require("mason")
  require("plugins.lsp.diagnostics").setup()

  local servers = {
    rust_analyzer = {},
    clangd = {},
    pyright = {},
    bashls = {},
    gopls = require("go.lsp").config(),
    svelte = {},
    tailwindcss = {},
    bufls = {},
    html = {},
    yamlls = {},
    jsonls = {},
    templ = {},
    biome = {},
    lua_ls = {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = {
              vim.api.nvim_get_runtime_file("", true),
              "${3rd}/luassert/library",
              "${3rd}/luv/library",
            },
          },
          telemetry = { enable = false },
          hint = { enable = true },
        },
      },
    },
  }

  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  local options = {
    capabilities = capabilities,
  }

  for server, opts in pairs(servers) do
    opts = vim.tbl_deep_extend("force", {}, options, opts or {})
    require("lspconfig")[server].setup(opts)
  end

  require("typescript-tools").setup({
    settings = {
      completions = {
        completeFunctionCalls = true,
      },
      tsserver_file_preferences = {
        includeInlayParameterNameHints = "all",
        includeInlayVariableTypeHints = true,
        includeCompletionsForModuleExports = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
        quotePreference = "auto",
      },
    },
  })
end

return M
