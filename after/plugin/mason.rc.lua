local statusMason, mason = pcall(require, 'mason')
local statusLspConfig, lspconfig = pcall(require, 'mason-lspconfig')

if (not statusMason) then
  print("Mason not found")
  return
end

if (not statusLspConfig) then
  print("Mason-lspconfig not installed")
end


mason.setup({
  ui = {
    icons = {
      package_installed = "✓"
    }
  }
})


lspconfig.setup({
  ensure_installed = { "sumneko_lua" }
})
