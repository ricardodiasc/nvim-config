local status, toggleterm = pcall(require, 'toggleterm')

if (not status) then
  print("toggleterm not installed")
  return;
end

toggleterm.setup({
  open_mapping = [[<C-\>]],
  hide_numbers = true,
  shade_terminals = true,
  start_in_insert = true,
  direction = float,
  close_on_exit = true,
  shell = vim.o.shell,
  persist_size = true,
  insert_mappings = true,
  start_in_insert = true,
  shading_factor = 2,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
  
})


function _G.set_terminal_keymaps() 
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]],opts)
--  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[ <C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[ <C-\><C-n><C-W>h ]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[ <C-\><C-n><C-W>j ]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[ <C-\><C-n><C-W>k ]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[ <C-\><C-n><C-W>l ]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


local Terminal = require("toggleterm.terminal").Terminal;

local lazygit = Terminal:new({cmd = "lazygit", direction = "float", hidden = true})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>ToggleTerm size=10 direction=horizontal<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>T", "<cmd>ToggleTerm direction=float<CR>", {noremap = true, silent = true})
