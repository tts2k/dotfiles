local M = {
  telescope = require("util.telescope"),
  ui = require("util.ui"),
}

local map = function(keys)
  for _, key in ipairs(keys) do
    local mode = key.mode or "n"
    local opts = {}

    for o_key, o in pairs(key) do
      if type(o_key) ~= "number" and o_key ~= "mode" then
        opts[o_key] = o
      end
    end

    vim.keymap.set(mode, key[1], key[2], opts)
  end
end

M.map = map

return M
