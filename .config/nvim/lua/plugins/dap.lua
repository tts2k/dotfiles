local M = {
  'mfussenegger/nvim-dap',
  ft = {
    'Javascript',
    'Javascriptreact',
    'Typescript',
    'Typescriptreact',
    'Cpp',
    'Rust'
  },
  dependencies = {
    {
      'mxsdev/nvim-dap-vscode-js',
    },
    {
      'rcarriga/nvim-dap-ui',
      config = true
    },
  }
}

function M.config()
  local dap = require('dap')

  -- cpptools/gdb (C/C++)
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
  -- rust
  dap.configurations.rust = dap.configurations.cpp

  -- javascript/typescript
  require("dap-vscode-js").setup({
    node_path = "node",
    debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug",
    debugger_cmd = { "js-debug-adapter" },
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
  })

  for _, language in ipairs({ "typescript", "javascript" }) do
    require("dap").configurations[language] = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require'dap.utils'.pick_process,
        cwd = "${workspaceFolder}",
      }
    }
  end
end

return M
