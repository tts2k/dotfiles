require"nvim-treesitter.configs".setup {
  ensure_installed = {
    'bash', 'c', 'cpp', 'c_sharp', 'cmake', 'comment',
    'css', 'html', 'java', 'javascript', 'json', 'latex',
    'lua', 'markdown', 'make', 'prisma', 'sql', 'vim',
    'typescript', 'scss', 'rust'
  },
  highlight = { enable = true },
  refactor = {
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true
    },
  },
  indent = {
    enable = true,
    disable = { "cpp", "rust" }
  },
  autotag = { enable = true },
  context_commentstring = {
    enable = true
  },
  autopairs = { enable = true },
}
