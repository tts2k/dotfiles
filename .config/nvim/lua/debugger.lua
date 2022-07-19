require('dapui').setup();

local dap = require('dap')

-- Clangd (C/C++)
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = os.getenv('HOME') .. '/.local/share/nvim/mason/bin/OpenDebugAD7'
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}

-- Key bindings
nnoremap('<Leader>du', function() require('dapui').toggle() end, 'DEBUG: Open debug UI')
nnoremap('<Leader>dd', function() require'dap'.continue() end, 'DEBUG: Continue')
nnoremap('<Leader>dr', function() require'dap'.run_last() end, 'DEBUG: Run last')
nnoremap('<Leader>dt', function() require'dap'.toggle_breakpoint() end, 'DEBUG: Set breakpoint')
nnoremap('<F5>', function() require'dap'.continue() end, 'silent','DEBUG Continue')
nnoremap('<F10>', function() require'dap'.step_over() end, 'silent', 'DEBUG Step over')
nnoremap('<F11>', function() require'dap'.step_into() end, 'silent', 'DEBUG Step into')
nnoremap('<F12>', function() require'dap'.step_out() end, 'silent', 'DEBUG Step out')
