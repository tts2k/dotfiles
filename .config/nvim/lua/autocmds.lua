local api = vim.api
local augroup = api.nvim_create_augroup("numbertoggle", {})

-- Open float diagnostic on hover
api.nvim_create_autocmd(
  { 'CursorHold, CursorHoldI' },
  { callback = function() vim.diagnostic.open_float(nil, { focus = false }) end }
)

api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
  pattern = "*",
  group = augroup,
  callback = function()
    if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
      vim.opt.relativenumber = true
    end
  end,
})

api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
  pattern = "*",
  group = augroup,
  callback = function()
    if vim.o.nu then
      vim.opt.relativenumber = false
      vim.cmd "redraw"
    end
  end,
})

-- Lsp attach events
api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local navic = require("nvim-navic")

    -- Signcolumn
    vim.api.nvim_set_option_value("signcolumn", "yes", { scope = "local" })

    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end

    -- Inlay Hint
    if client.server_capabilities.inlayHintProvider then
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
  end
})
