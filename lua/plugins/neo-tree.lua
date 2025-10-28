local mappings = {
  ["<cr>"] = { "open", config = { expand_nested_files = true } },
  ["l"] = { "open", config = { expand_nested_files = true } },
  ["h"] = "close_node",
  ["<space>"] = "toggle_node",
  ["p"] = { "toggle_preview", config = { use_float = true } },
}

return 
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    opts = {
      window = {
        mappings = mappings
      },
      close_if_last_window = true
    }
  }

