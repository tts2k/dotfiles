local keys = {
  {
    '<Leader>dd',
    function() require('dapui').toggle() end,
    desc = 'DEBUG: Open debug UI'
  },
  {
    '<F9>',
    function() require('dap').toggle_breakpoint() end,
    desc = 'DEBUG: Set breakpoint'
  },
  {
    '<F5>',
    function() require('dap').continue() end,
    desc = 'DEBUG: Continue'
  },
  {
    '<F10>',
    function() require('dap').step_over() end,
    desc = 'DEBUG: Step over'
  },
  {
    '<F11>',
    function() require('dap').setp_into() end,
    desc = 'DEBUG: Step into'
  },
  {
    '<F12>',
    function() require('dap').setp_out() end,
    desc = 'DEBUG: Step cout'
  },
}

return keys
