return {
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },

  -- GODOT
  {
    'QuickGD/quickgd.nvim',
    ft = { 'gdshader', 'gdshaderinc' },
    cmd = { 'GodotRun', 'GodotRunLast', 'GodotStart' },
    -- Use opts if passing in settings else use config
    init = function()
      vim.filetype.add {
        extension = {
          gdshaderinc = 'gdshaderinc',
        },
      }
    end,
    opts = {
      treesitter = true,
      cmp = true,
    },
  },

  {
    'wakatime/vim-wakatime',
    lazy = false,
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  },

  {
    'S1M0N38/love2d.nvim',
    cmd = 'LoveRun',
    opts = {},
    keys = {
      { '<leader>v', ft = 'lua', desc = 'LÖVE' },
      { '<leader>vv', '<cmd>LoveRun<cr>', ft = 'lua', desc = 'Run LÖVE' },
      { '<leader>vs', '<cmd>LoveStop<cr>', ft = 'lua', desc = 'Stop LÖVE' },
    },
  },

  {
    'andweeb/presence.nvim',
    config = function()
      require('presence').setup {
        auto_update = true,
        neovim_image_text = 'Eu uso Neovim, btw', -- Text displayed when hovered over the Neovim image
        main_image = 'neovim', -- Main image display (either "neovim" or "file")
        enable_line_number = false, -- Displays the current line number instead of the current project
        buttons = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
        show_time = true, -- Show the timer

        -- Rich Presence text options
        editing_text = 'Editando %s', -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
        file_explorer_text = 'Me perdi %s', -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
        git_commit_text = 'Commitando', -- Format string rendered when committing changes in git (either string or function(filename: string): string)
        plugin_manager_text = 'Configurando meu Neovim...', -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
        reading_text = 'Lendo %s', -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
        workspace_text = 'Trabalhando no %s', -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
        line_number_text = 'Line %s out of %s', -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
      }
    end,
  },
}
