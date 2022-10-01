-- DAP config

return function()
  local dap = require("dap")
  local dapui = require("dapui")
  local mason = require("franciscoj.mason")

  mason.ensure_tools({
    { name = "delve", version = "latest" },
  })


  dap.adapters.rdbg = function(callback, config)
    callback {
      type = "server",
      port = "${port}",
      executable = {
        command = "bin/rdbg",
        args = {
          "--open",
          "--port", "${port}",
          "--command",
          "--",
          config.command,
          config.script,
        },
      },
    }
  end

  dap.configurations.ruby = {
    {
      type = "rdbg",
      name = "Debug current file",
      request = "launch",
      localfs = true,
      command = "ruby",
      script = "${file}",
    }
  }

  dap.adapters.delve = function(callback, config)
    callback {
      type = "server",
      port = "${port}",
      executable = {
        command = mason.get_path("delve") .. "/dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
      }
    }
  end

  dap.configurations.go = {
    {
      type = "delve",
      name = "Debug",
      request = "launch",
      program = "${file}"
    },
    {
      type = "delve",
      name = "Debug test", -- configuration for debugging test files
      request = "launch",
      mode = "test",
      program = "${file}"
    },
    -- works with go.mod packages and sub packages
    {
      type = "delve",
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}"
    }
  }

  vim.keymap.set("n", "<leader>dd", dap.continue)
  vim.keymap.set("n", "<leader>ds", dap.step_over)
  vim.keymap.set("n", "<leader>di", dap.step_into)
  vim.keymap.set("n", "<leader>do", dap.step_out)
  vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
  -- nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
  -- nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
  -- nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
  -- nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
  -- nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>

  -- This doesn't seem to work. It is suppossed to add highlighting colors to the signs.
  local sign = vim.fn.sign_define
  sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
  sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
  sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
  sign("DapStopped", { text = "", texthl = "DapStopped", linehl = "", numhl = "" })

  dapui.setup()

  -- Enable dapui automatically
  dap.listeners.after.event_initialized["dapui_config"] = dapui.open
  dap.listeners.before.event_terminated["dapui_config"] = dapui.close
  dap.listeners.before.event_exited["dapui_config"] = dapui.close
end
