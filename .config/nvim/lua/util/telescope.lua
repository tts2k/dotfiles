-- Change telescope layout based on screen size
local telescope_opt = function(opts)
  local width = vim.o.columns

  if width > 100 then
    if opts == nil then
      opts = {}
    end
    opts.layout_strategy = 'horizontal'
  end

  return opts
end

-- Execute telescope builtins 
local exec_telescope_builtin = function(cmd, opts, theme)
  local builtin = require('telescope.builtin')

  -- Use theme if specified
  if (theme == nil) then
    opts = telescope_opt(opts)
    builtin[cmd](opts)
  else
    builtin[cmd](require('telescope.themes')[theme]())
  end
end

-- Execute telescope extensions 
local exec_telescope_ext = function(cmd, opts)
  local ext = require('telescope').extensions[cmd]
  opts = telescope_opt(opts)
  ext[cmd](opts)
end

return {
  ext = exec_telescope_ext,
  builtin = exec_telescope_builtin
}
