require('mason').setup()
require('trouble').setup()

-- Misc
require('luasnip.loaders.from_vscode').lazy_load() -- Setup friendly-snippets for luasnip
require('rust-tools').setup() -- Setup rust-tools

-- Setup autocompletion
local cmp = require("cmp")
local lspkind = require('lspkind')
local luasnip = require("luasnip")

--local has_words_before = function()
--  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
--end

--local cmp_tab_mapping = function(fallback)
--  if cmp.visible() then
--    cmp.select_next_item()
--  elseif luasnip.expand_or_jumpable() then
--    luasnip.expand_or_jump()
--  elseif has_words_before() then
--    cmp.complete()
--  else
--    fallback()
--  end
--end

local cmp_tab_mapping = function(fallback)
  if cmp.visible() then
      local entry = cmp.get_selected_entry()
      if not entry then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        cmp.confirm()
      end
    else
      fallback()
    end
  end

local cmp_s_tab_mapping = function(fallback)
  if cmp.visible() then
      cmp.select_prev_item()
  elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
  else
      fallback()
  end
end

cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]",
      })
    })
  },
  snippet = {
    expand = function(args)
        require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(cmp_tab_mapping, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(cmp_s_tab_mapping, { "i", "s" }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path'},
  }, {
    { name = 'buffer' }
  }),
})

-- Setup lspconfig.
vim.diagnostic.config({
    severity_sort = true,
    virtual_text = false,
    signs = true,
    float = { border = "single" }
})

local capabilities = require('cmp_nvim_lsp')
  .update_capabilities(vim.lsp.protocol
  .make_client_capabilities())
local pid = vim.fn.getpid()

local on_attach = function(_, _)
  vim.api.nvim_set_option_value('signcolumn', 'yes', { scope = 'local' })
end

require('lspconfig')['tsserver'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require('lspconfig')['clangd'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require('lspconfig')['omnisharp'].setup {
  on_attach = on_attach,
  cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(pid) },
  capabilities = capabilities,
}

require('lspconfig')['sumneko_lua'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = {'vim'} },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    },
  }
}

require('lspconfig')['rust_analyzer'].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
