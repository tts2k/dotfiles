require("nvim-autopairs").setup {
  disable_filetype = { "TelescopePrompt" },
  check_ts = true
}

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
local luasnip = require("luasnip")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp_tab_mapping = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  elseif has_words_before() then
    cmp.complete()
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
  })
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp')
  .update_capabilities(vim.lsp.protocol
  .make_client_capabilities())
local pid = vim.fn.getpid()

require('lspconfig')['tsserver'].setup {
  capabilities = capabilities,
}

require('lspconfig')['clangd'].setup {
  capabilities = capabilities,
}

require('lspconfig')['omnisharp'].setup {
  cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(pid) },
  capabilities = capabilities,
}

require('lspconfig')['sumneko_lua'].setup {
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
