vim.g.mapleader = ' '

vim.g.markdown_fenced_languages = {"html", "javascript", "typescript", "css", "scss", "lua", "java"}


vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.wo.relativenumber = true

vim.opt.hlsearch = true
vim.showcmd = true
vim.opt.backup = false
vim.opt.cmdheight = 1

vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'zsh'


vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.breakindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*', '*/.git/*' }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = 'set nopaste'
})

vim.opt.formatoptions:append { 'r' }


-- vim.api.nvim_set_keymap('n', '<Leader><Tab>', print("test"), {})

require('user/highlights')
require('user/keymap')
require('user/plugins')


-- Clipboard
local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has "macunix"
local is_win = has "win32"
local is_linux = has "linux"

if is_mac then
  vim.opt.clipboard:append { "unnamedplus" }
end
if is_win then
  vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }
end
if is_linux then
  vim.opt.clipboard:append { "unnamedplus" }
end
