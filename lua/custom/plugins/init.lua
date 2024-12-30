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
    }, -- remove config and use this if changing settings.
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
}
