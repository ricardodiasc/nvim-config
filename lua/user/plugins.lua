local status, packer = pcall(require, "packer")

if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[ packadd packer.nvim ]]

packer.startup(function(use)
  use { 'wbthomason/packer.nvim' }
  use { 'nvim-lualine/lualine.nvim', requires = 'kyazdani42/nvim-web-devicons' } --Statusline
  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' } -- Fuzy finder
  use { 'svrana/neosolarized.nvim', requires = { 'tjdevries/colorbuddy.nvim' } }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use 'L3MON4D3/LuaSnip' -- Snippets from lua
  use 'neovim/nvim-lspconfig' -- Language service
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/nvim-cmp' -- nvim completion
  use 'hrsh7th/cmp-buffer' -- nvim-cmp buffer for words
  use 'hrsh7th/cmp-nvim-lsp' -- nvi-cmp source for neovim's built-in LSP
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'akinsho/nvim-bufferline.lua'
end)
