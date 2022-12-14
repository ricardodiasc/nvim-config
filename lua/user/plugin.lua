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
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use 'neovim/nvim-lspconfig' -- Language service
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
end)
