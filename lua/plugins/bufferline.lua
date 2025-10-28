return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function ()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",

diagnostics_indicator = function(count, level, diagnostics_dict, context)
  local s = " "
  for e, n in pairs(diagnostics_dict) do
    local sym = e == "error" and " "
      or (e == "warning" and " " or " ")
    s = s .. n .. sym
  end
  return s
end      },
      highlights = {
        buffer_selected = {
          bold = true,
          italic = false,
        },
       error = {
          fg = '#ff5555',  -- ярко-красный
          bold = true,
        },
        error_diagnostic = {
          fg = '#ff5555',
          bold = true,
        },
        
        -- Видимый буфер с ошибкой
        error_visible = {
          fg = '#ff5555',
          bold = true,
        },
        error_diagnostic_visible = {
          fg = '#ff5555',
          bold = true,
        },
        
        -- Активный буфер с ошибкой
        error_selected = {
          fg = '#ff5555',
          bold = true,
        },
        error_diagnostic_selected = {
          fg = '#ff5555',
          bold = true,
        },
      }  
    })

  end            
}
