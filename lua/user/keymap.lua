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
