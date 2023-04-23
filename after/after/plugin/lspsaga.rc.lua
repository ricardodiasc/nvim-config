local status, saga = pcall(require, 'lspsaga')

if (not status) then
  print("lspsaga not installed")
  return
end

saga.setup({})

--[[
saga.init_lsp_saga {
  server_filetype_map = {
    typescript = "typescript"
  }
}
--]]

local opts = { noremap = true, silent = true }

local keymap = vim.keymap;

keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)

keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
keymap.set('n', 'v', '<cmd>Lspsaga code_action<CR>', opts)
