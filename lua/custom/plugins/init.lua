return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    theme = 'hyper',
    config = function()
      require('dashboard').setup {
        config = {
          packages = { enable = true },
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
          },
        }
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },

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
    'pocco81/auto-save.nvim',
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
      { '<leader>v',  ft = 'lua',          desc = 'LÖVE' },
      { '<leader>vv', '<cmd>LoveRun<cr>',  ft = 'lua',   desc = 'Run LÖVE' },
      { '<leader>vs', '<cmd>LoveStop<cr>', ft = 'lua',   desc = 'Stop LÖVE' },
    },
  },

  {
    'p00f/clangd_extensions.nvim',
    config = function()
      require('clangd_extensions').setup {
        inlay_hints = {
          inline = vim.fn.has 'nvim-0.10' == 1,
          -- Options other than `highlight' and `priority' only work
          -- if `inline' is disabled
          -- Only show inlay hints for the current line
          only_current_line = false,
          -- Event which triggers a refresh of the inlay hints.
          -- You can make this { "CursorMoved" } or { "CursorMoved,CursorMovedI" } but
          -- note that this may cause higher CPU usage.
          -- This option is only respected when only_current_line is true.
          only_current_line_autocmd = { 'CursorHold' },
          -- whether to show parameter hints with the inlay hints or not
          show_parameter_hints = true,
          -- prefix for parameter hints
          parameter_hints_prefix = '<- ',
          -- prefix for all the other hints (type, chaining)
          other_hints_prefix = '=> ',
          -- whether to align to the length of the longest line in the file
          max_len_align = false,
          -- padding from the left if max_len_align is true
          max_len_align_padding = 1,
          -- whether to align to the extreme right or not
          right_align = false,
          -- padding from the right if right_align is true
          right_align_padding = 7,
          -- The color of the hints
          highlight = 'Comment',
          -- The highlight group priority for extmark
          priority = 100,
        },
        ast = {
          -- These are unicode, should be available in any font
          role_icons = {
            type = '🄣',
            declaration = '🄓',
            expression = '🄔',
            statement = ';',
            specifier = '🄢',
            ['template argument'] = '🆃',
          },
          kind_icons = {
            Compound = '🄲',
            Recovery = '🅁',
            TranslationUnit = '🅄',
            PackExpansion = '🄿',
            TemplateTypeParm = '🅃',
            TemplateTemplateParm = '🅃',
            TemplateParamObject = '🅃',
          },
          --[[ These require codicons (https://github.com/microsoft/vscode-codicons)
            role_icons = {
                type = "",
                declaration = "",
                expression = "",
                specifier = "",
                statement = "",
                ["template argument"] = "",
            },

            kind_icons = {
                Compound = "",
                Recovery = "",
                TranslationUnit = "",
                PackExpansion = "",
                TemplateTypeParm = "",
                TemplateTemplateParm = "",
                TemplateParamObject = "",
            }, ]]

          highlights = {
            detail = 'Comment',
          },
        },
        memory_usage = {
          border = 'none',
        },
        symbol_info = {
          border = 'none',
        },
      }
    end,
  },

  {
    'andweeb/presence.nvim',
    config = function()
      require('presence').setup {
        auto_update         = true,
        neovim_image_text   = "Eu uso Neovim, btw", -- Text displayed when hovered over the Neovim image
        main_image          = "neovim",               -- Main image display (either "neovim" or "file")
        enable_line_number  = false,                  -- Displays the current line number instead of the current project
        buttons             = true,                   -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
        show_time           = true,                   -- Show the timer

        -- Rich Presence text options
        editing_text        = "Editando %s",     -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
        file_explorer_text  = "Me perdi %s",    -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
        git_commit_text     = "Commitando", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
        plugin_manager_text = "Configurando meu Neovim...", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
        reading_text        = "Lendo %s",     -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
        workspace_text      = "Trabalhando no %s",  -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
        line_number_text    = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
      }
    end
  },
}
