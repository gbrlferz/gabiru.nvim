if vim.loop.os_uname().sysname ~= "Windows_NT" then
  local port = os.getenv('gdscript_port') or '6005'
  local cmd = { "ncat", "localhost", port } -- explicitly use nix's `ncat`
  local pipe = '/tmp/godot.pipe'

  -- start pipe server
  if not vim.tbl_contains(vim.fn.serverlist(), pipe) then
    vim.fn.serverstart(pipe)
  end

  -- start the lsp client
  vim.lsp.start({
    name = 'godot',
    cmd = cmd,
    root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
  })

  vim.api.nvim_create_autocmd('filetype', {
    pattern = 'gdscript',
    callback = function()
      vim.bo.expandtab = false -- tabs instead of spaces
      vim.bo.tabstop = 4
      vim.bo.shiftwidth = 4
    end
  })
end
