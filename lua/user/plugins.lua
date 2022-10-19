local status, packer = pcall(require, "packer")

if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[ packadd packer.nvim ]]

packer.startup(function(use)
  use { 'wbthomason/packer.nvim' }
  use { 'nvim-lualine/lualine.nvim', requires = 'kyazdani42/nvim-web-devicons'} --Statusline
  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use 'neovim/nvim-lspconfig'
end)
