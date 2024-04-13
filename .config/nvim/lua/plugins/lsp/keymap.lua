local ui = require("util.ui")

local toggle_virtual_lines = function()
  vim.diagnostic.config({
    virtual_lines = not vim.diagnostic.config().virtual_lines,
  })
end

local keys = {
  {
    "<Leader>P",
    function()
      vim.lsp.buf.code_action()
    end,
    desc = "Code action",
  },
  {
    "K",
    function()
      vim.lsp.buf.hover()
    end,
    desc = "Open hover menu",
  },
  {
    "<Leader>r",
    function()
      vim.lsp.buf.rename()
    end,
    desc = "LSP rename",
  },

  -- find/goto
  {
    "<Leader>fm",
    function()
      ui.telescope.builtin("marks")
    end,
    desc = "Show list of marks",
  },
  {
    "<Leader>fd",
    function()
      ui.telescope.builtin("lsp_definitions", nil, "get_cursor")
    end,
    desc = "Show definitions",
  },
  {
    "<Leader>ft",
    function()
      ui.telescope.builtin("lsp_type_definitions", nil, "get_cursor")
    end,
    desc = "Show type definitions",
  },
  {
    "<Leader>fi",
    function()
      ui.telescope.builtin("lsp_implementations", nil, "get_cursor")
    end,
    desc = "Show implementations",
  },
  {
    "<Leader>fr",
    function()
      ui.telescope.builtin("lsp_references", nil, "get_cursor")
    end,
    desc = "Show references",
  },

  -- diagnostic
  {
    "<Leader>'",
    function()
      toggle_virtual_lines()
    end,
    desc = "Toggle virtual line",
  },
  {
    "<Leader>df",
    function()
      vim.diagnostic.open_float()
    end,
    desc = "Open diagnostic float",
  },
  {
    "<Leader>dn",
    function()
      vim.diagnostic.goto_next()
    end,
    desc = "Next diagnostic",
  },
  {
    "<Leader>dp",
    function()
      vim.diagnostic.goto_prev()
    end,
    desc = "Prev diagnostic",
  },
}

return keys
