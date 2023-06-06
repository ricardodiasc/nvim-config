local keymap = vim.keymap


-- Check what it does....
keymap.set('n', 'x', '_x')


-- Increment / Decrement

keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')


-- Delete a word backwords - not working?!?
-- keymap.set('n', 'dw', 'vb"_d')

keymap.set('n', 'te', ':tabedit<Return>')
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')


-- Java 


function get_spring_boot_runner(profile, debug)
  local debug_param = ""

  if(debug) then
    debug_param = " --debug-jvm "
  end

  local profile_param = ""
  if(profile) then 
    profile_param = " --args=\"--spring.profiles.active=" .. profile .. "\" "
  end

  return "./gradlew bootRun " .. debug_param .. profile_param
end


function run_spring_boot(debug) 
  -- vim.cmd('term ' .. get_spring_boot_runner('local', debug))
  vim.cmd("TermExec cmd='" .. get_spring_boot_runner('local', debug) .. "' ")
  
  -- vim.api.nvim_set_keymap("n", "<cmd>TermExec cmd='" .. get_spring_boot_runner() .. ";exit' <CR>", {noremap = true, silent = true})
  
end

function attach_to_debug() 
  local dap = require('dap')

  dap.configurations.java = {
    {
      type = 'java';
      request = 'attach';
      name = "Attach to the process";
      hostName = 'localhost';
      port = '5005';
    }
  }
  dap.continue()
end

keymap.set('n', '<Leader>da', ':lua attach_to_debug()<CR>')

keymap.set('n', '<Leader>joi', ':lua require("jdtls").organize_imports()<CR>')
keymap.set('n', '<Leader>jc', ':lua require("jdtls").compile("incremental")<CR>')
-- keymap.set('n', '<Leader>jsr', function() run_spring_boot() end)

keymap.set('n', '<F9>', function() run_spring_boot(false) end )
keymap.set('n', '<F10>', function() run_spring_boot(true) end )


keymap.set('n', '<F5>', ':lua require"dap".continue()<CR>')
keymap.set('n', '<F6>', ':lua require"dap".step_over()<CR>')
keymap.set('n', '<F7>', ':lua require"dap".step_into()<CR>')
keymap.set('n', '<F8>', ':lua require"dap".step_out()<CR>')

keymap.set('n', '<Leader>b', ':lua require"dap".toggle_breakpoint()<CR>')
keymap.set('n', '<Leader>B', ':lua require"dap".set_breakpoint(vim.fn.input("Condition: "))<CR>')
keymap.set('n', '<Leader>dl',':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log: "))<CR>')
keymap.set('n', '<Leader>dr',':lua require"dap".repl.open()<CR>')



function get_test_runner(test_name, debug) 
  if debug then
    return './gradlew test --debug-jvm --tests "' .. test_name .. '"'
  end
  
  return './gradlew test --tests "' .. test_name .. '"'
end

function run_java_test_method(debug)
  local utils = require'user/utils'
  local method_name = utils.get_current_full_method_name()
  -- print(get_test_runner(method_name, false))
  -- vim.cmd('term ' .. get_test_runner(method_name, debug) )
  
  vim.cmd("TermExec cmd='" .. get_test_runner(method_name, debug) .. "' ")
end

function run_java_test_class(debug)
  local utils = require'user/utils'
  local class_name = utils.get_current_full_class_name()
  -- vim.cmd('term ' .. get_test_runner(class_name, debug))

  vim.cmd("TermExec cmd='" .. get_test_runner(class_name, debug) .. "' ")
end

keymap.set('n', '<Leader>jtm', function() run_java_test_method(false) end )
keymap.set('n', '<Leader>jTM', function() run_java_test_method(true) end )
keymap.set('n', '<Leader>jtc', function() run_java_test_class(false) end )
keymap.set('n', '<Leader>jTC', function() run_java_test_class(true) end )

-- Nvtree
keymap.set('n', '<Leader>e', '<cmd>NvimTreeFindFileToggle<CR>')


-- Git 
keymap.set('n', '<Leader>gb', '<cmd>Gitsigns toggle_current_line_blame<CR>')


-- Trouble
keymap.set('n', '<Leader>xt', '<cmd>TroubleToggle<CR>')

function java_commands() 
end
