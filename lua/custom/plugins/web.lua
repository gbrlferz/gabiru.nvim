return {
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    ft = { "html", },
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end
  },

  {
    'windwp/nvim-ts-autotag',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('nvim-ts-autotag').setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false
        },
      })
    end,
  }
}
