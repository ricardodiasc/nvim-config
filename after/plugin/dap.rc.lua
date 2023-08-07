local status, dap = pcall(require, 'dap')
local statusDapUI, dapui = pcall(require, 'dapui')


if (not status) then 
  print("dap is not installed")
  return
end

if (not statusDapUI) then
  print("dapui is not installed")
  return
end

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function ()
  dapui.open()
end


dap.listeners.before.event_terminated["dapui_config"] = function ()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function ()
  dapui.close()
  
end
