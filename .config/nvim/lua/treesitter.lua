require"nvim-treesitter.configs".setup {
  ensure_installed = {
    'bash', 'cpp', 'c_sharp', 'cmake', 'comment',
    'css', 'html', 'java', 'javascript', 'json', 'latex',
    'lua', 'markdown', 'make', 'prisma', 'sql', 'vim',
    'typescript', 'tsx', 'scss', 'rust', 'python'
  },
  highlight = { enable = true },
  autotag = { enable = true },
  tree_docs = { enable = true },
  indent = { enable = true },
}
