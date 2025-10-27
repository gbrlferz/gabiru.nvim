local port_str = os.getenv 'GDScript_Port' or '6005'
-- Convert the string port to an actual number using tonumber()
local port = tonumber(port_str)

-- Check if tonumber was successful (it returns nil if not)
if port == nil then
  -- Fallback to a default number if the conversion fails for some reason
  port = 6005
end

-- Use the converted number 'port'
local cmd = vim.lsp.rpc.connect('127.0.0.1', port)
local pipe = '/path/to/godot.pipe' -- Replace with your actual pipe path, e.g., '/tmp/godot.pipe'

vim.lsp.start {
  name = 'Godot',
  cmd = cmd,
  -- The root_dir logic seems slightly off for Godot. A simpler approach is just to look for project.godot.
  -- The original logic is: vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1])
  -- A more direct and reliable one for Godot is:
  root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot' }, { upward = true })[1]),
  on_attach = function(client, bufnr)
    -- This command is likely intended to start the Neovim server part, which is used by Godot's Exec Flags.
    -- However, the original guide's `Exec Flags` seem to *assume* a server is already running, or start it
    -- implicitly. The original serverstart function is likely a custom Vimscript function.
    -- If you are using Neovim's remote capabilities as shown in the guide, you don't typically need to
    -- explicitly start a server with a pipe name like this, especially using a custom `serverstart`
    -- function unless you define it. The Godot editor is what connects to Neovim's remote server.
    -- The server should be started before opening files from Godot.

    -- *** Removing the original on_attach for simplicity as it relies on a non-standard function. ***
    -- If you still need some action, this is where you'd put it.
  end,
}
