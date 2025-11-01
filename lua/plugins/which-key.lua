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
        { "<leader>h", group = "Highlights" },
        { "<leader>w", desc = "Save file" },
        { "<leader>q", desc = "Window quit" },
        { "<leader>e", desc = "File Explorer (Toggle)" },
        { "<leader>x", group = "Diagnostics" },
        -- Git
        { "<leader>g", group = "Git" },
        { "<leader>gc", group = "Git Conflict" },
        { "<leader>gd", group = "Git Diffview" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
    end,
  },
}
