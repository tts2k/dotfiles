require('mason').setup()
require('trouble').setup()

-- Misc
require('luasnip.loaders.from_vscode').lazy_load() -- Setup friendly-snippets for luasnip
require('neogen').setup({
  enable = true,
  snippet_engine = "luasnip",
  languages = {
    typescript = {
      template = {
        annotation_convention = "jsdoc"
      }
    }
  }
})
require('rust-tools').setup() -- Setup rust-tools

-- Markdown preview
require('peek').setup()
vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})

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
    elseif luasnip.jumpable(1) then
        luasnip.jump(1)
    else
      fallback()
    end
  end

local cmp_s_tab_mapping = function(fallback)
  if cmp.visible() then
    cmp.close()
  elseif luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    fallback()
  end
end

cmp.setup({
  window = {
    completion = {
      border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
      winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
    },
    documentation = {
      border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
      winhighlight = 'Normal:CmpDocs,FloatBorder:CmpDocsBorder',
    },
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      preset = "codicons",
      maxwidth = 50,
      menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
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
    ["<C-b>"] = cmp.mapping.scroll_docs(4),
    ["<C-f>"] = cmp.mapping.scroll_docs(-4),
    ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' },
    { name = 'path'},
  }, {
    { name = 'buffer' }
  }),
})

--Mapping <CR> for autopairs
require('nvim-autopairs').setup()
local cmp_autopairs = require('nvim-autopairs.completion.cmp');
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- Setup lspconfig.
vim.diagnostic.config({
    severity_sort = true,
    virtual_text = false,
    signs = true,
    float = { border = "single" }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
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

require('lspconfig')['pyright'].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
require('lspconfig')['prismals'].setup({
  on_attach = on_attach,
  capabilities = capabilities
})

local null_ls = require('null-ls');

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prismaFmt
  }
})
