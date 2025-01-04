return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        config = {},
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
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
      { '<leader>v', ft = 'lua', desc = 'LÖVE' },
      { '<leader>vv', '<cmd>LoveRun<cr>', ft = 'lua', desc = 'Run LÖVE' },
      { '<leader>vs', '<cmd>LoveStop<cr>', ft = 'lua', desc = 'Stop LÖVE' },
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
}
