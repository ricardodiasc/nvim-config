local status, rust_tools = pcall(require, 'rust-tools')
local statuscmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')


if (not statuscmp) then
  print("cmp-nvim-lsp not installed")
  return;
end

if (not status) then
  print("rust-tools not installed")
  return;
end


local function on_attach(_, bufnr)
  vim.keymap.set('n', '<Leader>k', rust_tools.hover_actions.hover_actions, {buffer = bufnr} )
  vim.keymap.set('n', '<Leader>a', rust_tools.code_action_group.code_action_group, {buffer = bufnr})
end


local capabilities = cmp_nvim_lsp.default_capabilities()


rust_tools.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
  tools = {
    hover_actions = {
      auto_focus = true
    },
  },
})
