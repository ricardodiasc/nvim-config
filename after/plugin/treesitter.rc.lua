local status, ts = pcall(require, 'nvim-treesitter.configs')

if (not status) then
  print("treesitter not installed")
  return
end

ts.setup({
  hightlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    'tsx',
    'lua',
    'json',
    'css',
    'scss',
    'typescript',
    'java',
    'rust'
  },
  auto_tag = {
    enable = true,
  }
})
