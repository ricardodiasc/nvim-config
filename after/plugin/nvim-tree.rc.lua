local status, nvtree = pcall(require, 'nvim-tree')

if (not status) then
  print("nvim-tree not instaled")
  return
end


nvtree.setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})




