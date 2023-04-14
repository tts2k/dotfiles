local M = {
  'lukas-reineke/indent-blankline.nvim',
  event = 'BufReadPre',
  dependencies = {
    'nvim-treesitter/nvim-treesitter'
  }
}

function M.config()
  require('indent_blankline').setup {
    show_current_context = true,
    filetype_exclude = { "dashboard", "help" },
    char = "│",
    context_char = "│",
    context_patterns = {
     "class",
      "^func",
      "method",
      "^if",
      "while",
      "for",
      "with",
      "try",
      "except",
      "arguments",
      "argument_list",
      "object",
      "dictionary",
      "element",
      "table",
      "tuple",
      "do_block",
      "^.*_expression",
      "let_declaration",
      "block",
      "^.*_block",
    }
  }
end

return M
