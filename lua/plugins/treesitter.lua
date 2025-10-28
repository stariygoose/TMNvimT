return {
  'nvim-treesitter/nvim-treesitter',
  branch = "master",
  -- event = { "BufReadPost", "BufNewFile" },
  build = ':TSUpdate',
  config = function()
   require'nvim-treesitter.configs'.setup({
    ensure_installed = {
      'lua',
      'rust',
      'typescript',
      'javascript',
      'tsx'
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },

    sync_install = false,

    indent = { enable = true },
  })
  end,
}
