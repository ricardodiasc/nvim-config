local status, gitsigns = pcall(require, 'gitsigns')

if (not status) then
  print("gitsigns not installed")
  return
end

gitsigns.setup {
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 100,
    virt_text_pos = "eol",
  },
  current_line_blame_formatter = '\t\t<author>, <author_time:%Y-%m-%d> - <summary>',
}
