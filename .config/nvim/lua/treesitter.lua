require"nvim-treesitter.configs".setup {
  ensure_installed = {
    'bash', 'c', 'cpp', 'c_sharp', 'cmake', 'comment',
    'css', 'html', 'java', 'javascript', 'json', 'latex',
    'lua', 'markdown', 'make', 'prisma', 'sql', 'vim',
    'typescript', 'scss', 'rust'
  },
  highlight = { enable = true },
  autotag = { enable = true },
  indent = { enable = true },
}
