return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "vtsls",
        "eslint",
        "rust_analyzer",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          { name = "luasnip" },
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              -- Если меню видно, выбрать следующий элемент
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
              -- Опционально: если вы используете сниппеты (например, LuaSnip),
              -- можно добавить логику для перехода/расширения сниппетов
              --[[
      elseif require('luasnip').expand_or_jumpable() then
        require('luasnip').expand_or_jump()
      --]]
            else
              -- Иначе, выполнить действие по умолчанию для <Tab> (например, вставить табуляцию)
              fallback()
            end
          end, { 'i', 's' }), -- 'i' для Insert Mode, 's' для Select Mode (для сниппетов)

          -- <S-Tab> для выбора предыдущего элемента
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              -- Если меню видно, выбрать предыдущий элемент
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
              -- Опционально: логика для сниппетов (переход назад)
              --[[
      elseif require('luasnip').jumpable(-1) then
        require('luasnip').jump(-1)
      --]]
            else
              -- Иначе, выполнить действие по умолчанию для <S-Tab>
              fallback()
            end
          end, { 'i', 's' }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
      })
    end,
  },
  {
    "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
    lazy = false,            -- REQUIRED: tell lazy.nvim to start this plugin at startup
    config = function() end,
  },
  {
    "mrcjkb/rustaceanvim",
    lazy = false, -- This plugin is already lazy
  },
}
