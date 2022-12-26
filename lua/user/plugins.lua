--local status, packer = pcall(require, "packer.nvim")

-- if (not status) then
--  print("Packer is not installed")
--  vim.cmd [[ packadd packer.nvim ]]
--  return
-- end

-- vim.cmd [[ packadd packer.nvim ]]
-- vim._update_package_paths()

return require('packer').startup(function(use)
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
  use 'glepnir/lspsaga.nvim'

  use 'williamboman/mason-lspconfig.nvim'
  use 'williamboman/mason.nvim'
  use 'jose-elias-alvarez/null-ls.nvim' -- Use neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's build-in LSP client
  use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }
end)
