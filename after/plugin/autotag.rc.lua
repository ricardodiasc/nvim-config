local status, autotag = pcall(require, 'nvim-ts-autotag')

if (not status) then
  print("Nvim-ts-autotag not installed")
  return
end

autotag.setup({})
