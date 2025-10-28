return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = function()
    local npairs = require('nvim-autopairs')
    local Rule = require('nvim-autopairs.rule')
    local cond = require('nvim-autopairs.conds')
    
    npairs.setup({
      check_ts = true,
      enable_check_bracket_line = true,  -- не автозакрывать если уже есть закрывающая скобка
      ignored_next_char = "[%w%.]",      -- игнорировать если после буква или точка
      
      ts_config = {
        lua = {'string', 'source'},
        javascript = {'string', 'template_string'},
        typescript = {'string', 'template_string'},
      },
      
      disable_filetype = { "TelescopePrompt", "vim" },
      
      -- Fast wrap (Alt+e для быстрого обертывания)
      fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        offset = 0,
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'PmenuSel',
        highlight_grey = 'LineNr'
      },
    })
    
    -- Кастомные правила
    
    -- Пробел между скобками: (|) -> ( | )
    local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
    npairs.add_rules({
      Rule(' ', ' ')
        :with_pair(function(opts)
          local pair = opts.line:sub(opts.col - 1, opts.col)
          return vim.tbl_contains({
            brackets[1][1] .. brackets[1][2],
            brackets[2][1] .. brackets[2][2],
            brackets[3][1] .. brackets[3][2],
          }, pair)
        end)
    })
    
    -- Arrow function в JS/TS: () => {}
    npairs.add_rules({
      Rule('%(.*%)%s*%=>$', ' {  }', { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' })
        :use_regex(true)
        :set_end_pair_length(2)
    })
    
    -- HTML/JSX: автозакрывать теги
    npairs.add_rules({
      Rule('<', '>', { 'html', 'javascriptreact', 'typescriptreact' })
        :with_pair(cond.before_regex('%a+'))
    })
  end,
}
