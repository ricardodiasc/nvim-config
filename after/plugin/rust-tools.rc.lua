local status, rust_tools = pcall(require, 'rust-tools')

if (not status) then
  print("rust-tools not installed")
  return;
end

rust_tools.setup()
