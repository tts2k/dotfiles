local M = {
  'echasnovski/mini.nvim',
  event = "VeryLazy",
  dependencies = {
    'nvim-treesitter/nvim-treesitter'
  },
  use = {
    "comment",
    {
      "surround",
      opts = {
        mappings = {
          add = "gza",
          delete = "gzd",
          find = "gzf",
          find_left = "gzF",
          highlight = "gzh",
          replace = "gzr",
          update_n_lines = "gzn"
        }
      }
    },
    {
      "ai",
      opts = function()
        local ai = require("mini.ai")
        return {
          n_lines = 500,
          custom_textobjects = {
            o = ai.gen_spec.treesitter({
              a = { "@block.outer", "@conditional.outer", "@loop.outer" },
              i = { "@block.inner", "@conditional.inner", "@loop.inner" },
            }, {}),
            f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
            c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
          },
        }
      end
    }
  }
}

function M.config(plugin)
  for i in ipairs(plugin.use) do
    local use = plugin.use[i]

    if (type(use) == 'string') then
      require('mini.' .. use).setup()
      goto continue
    end

    if (type(use) == 'table' and type(use.opts) == 'function') then
      require('mini.' .. use[1]).setup(use.opts())
      goto continue
    end

    if (type(use) == 'table') then
      require('mini.' .. use[1]).setup(use.opts)
      goto continue
    end

    ::continue::
  end
end

return M
