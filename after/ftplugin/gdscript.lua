local port = os.getenv('GDScript_Port') or '6005'
local cmd = { "ncat", "localhost", port } -- Explicitly use Nix's `ncat`
local pipe = '/tmp/godot.pipe'

-- Start pipe server
if not vim.tbl_contains(vim.fn.serverlist(), pipe) then
  vim.fn.serverstart(pipe)
end

-- Start the LSP client
vim.lsp.start({
  name = 'Godot',
  cmd = cmd,
  root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'gdscript',
  callback = function()
    vim.bo.expandtab = false -- Tabs instead of spaces
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
  end
})
