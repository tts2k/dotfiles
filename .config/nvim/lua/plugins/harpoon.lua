local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}

function M.config()
  local harpoon = require("harpoon")
  local conf = require("telescope.config").values

  local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
      table.insert(file_paths, item.value)
    end

    require("telescope.pickers")
      .new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      })
      :find()
  end

  harpoon:setup()

  local keys = {
    {
      "<Leader>ha",
      function()
        harpoon:list():add()
      end,
      desc = "Harpoon: add to list",
    },
    {
      "<Leader>hp",
      function()
        toggle_telescope(harpoon:list())
      end,
      desc = "Harpoon: Open list",
    },
    {
      "<Leader>hh",
      function()
        harpoon:list():select(1)
      end,
      desc = "Harpoon: Select list 1",
    },
    {
      "<Leader>hj",
      function()
        harpoon:list():select(2)
      end,
      desc = "Harpoon: Select list 2",
    },
    {
      "<Leader>hk",
      function()
        harpoon:list():select(3)
      end,
      desc = "Harpoon: Select list 3",
    },
    {
      "<Leader>hl",
      function()
        harpoon:list():select(4)
      end,
      desc = "Harpoon: Select list 4",
    },
    {
      "]h",
      function()
        harpoon:list():next()
      end,
      desc = "Harpoon: Next in list",
    },
    {
      "[h",
      function()
        harpoon:list():prev()
      end,
      desc = "Harpoon: Previous in list",
    },
  }

  require("util").map(keys)
end

return M
