local M = {}

function M.setup()
  local map = require('util.map')
  local keys = {
    ['<Leader>du'] = {
      action = function() require('dapui').toggle() end,
      desc = 'DEBUG: Open debug UI'
    },
    ['<Leader>dt'] = {
      action = function() require('dap').toggle_breakpoint() end,
      desc = 'DEBUG: Set breakpoint'
    },
    ['F5'] = {
      action = function() require('dap').continue() end,
      desc = 'DEBUG: Continue'
    },
    ['F10'] = {
      action = function() require('dap').step_over() end,
      desc = 'DEBUG: Step over'
    },
    ['F11'] = {
      action = function() require('dap').setp_into() end,
      desc = 'DEBUG: Step into'
    },
    ['F12'] = {
      action = function() require('dap').setp_out() end,
      desc = 'DEBUG: Step cout'
    },
  }

  map(keys)
end

return M
