local M = {
  'echasnovski/mini.nvim',
  event = "VeryLazy",
  dependencies = {
    'nvim-treesitter/nvim-treesitter'
  },
  opts = {
    "comment",
    "trailspace",
    "bracketed",
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

function M.config(_, opts)
  for i in ipairs(opts) do
    local use = opts[i]
    local use_type = type(use)

    -- string
    if (use_type == 'string') then
      require('mini.' .. use).setup()
      goto continue
    end

    -- function
    if (use_type == 'table' and type(use.opts) == "function") then
      require('mini.' .. use[1]).setup(use.opts())
      goto continue
    end

    -- table
    require('mini.' .. use[1]).setup(use.opts)

    ::continue::
  end
end

return M
