return {
  {
    'datsfilipe/min-theme.nvim',
    -- priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme('min-theme')  -- Enable on start
    -- end,
  },
  { 'datsfilipe/vesper.nvim', opts = {} },
  {
      'sainnhe/sonokai',
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.sonokai_enable_italic = true
        vim.cmd.colorscheme('sonokai')
      end
    },
  {
    "nyoom-engineering/oxocarbon.nvim",
    -- priority = 1000,
    -- config = function ()
    --   vim.cmd.colorscheme('oxocarbon')
    -- end
  }
}
