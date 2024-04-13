local M = {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = 'BufReadPost',
  opts = {
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/nvim-tree-docs',
    'windwp/nvim-ts-autotag'
  }
}

function M.init()
  -- Extra filetypes
  vim.filetype.add({
    extension = {
      templ = "templ"
    }
  })
end

function M.config()
  require('nvim-treesitter.configs').setup {
    ensure_installed = {
      'bash', 'cpp', 'c_sharp', 'cmake', 'comment', 'go',
      'css', 'html', 'java', 'javascript', 'json', 'latex',
      'lua', 'markdown', 'make', 'prisma', 'sql', 'vim',
      'typescript', 'tsx', 'scss', 'rust', 'python', 'svelte',
      'markdown_inline', 'regex'
    },
    highlight = { enable = true },
    autotag = { enable = true },
    tree_docs = { enable = true },
    indent = { enable = true },
  }

  vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
end

return M
