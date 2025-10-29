return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      win = {
        border = "rounded",
      },
      spec = {
        { "<leader>f", group = "Find (Telescope)" },
        { "<leader>c", group = "Code (LSP)" },
        { "<leader>b", group = "Buffers" },
        { "<leader>h", group = "Highlights" },
        { "<leader>w", desc = "Save" },
        { "<leader>q", desc = "Window quit" },
        { "<leader>e", desc = "File Explorer" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
    end,
  },
}
