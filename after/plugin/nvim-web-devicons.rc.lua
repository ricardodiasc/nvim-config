local status, icons = pcall(require, "nvim-web-devicons")

if (not status) then
  print("nvim-web-devicons not found")
  return
end

icons.setup {
  override = {
    -- Update when on mac or linux

  } ,

  default = true
}
