return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    -- { "<leader>fe", false },
    { "<leader>fe", "<cmd>Neotree toggle position=right<cr>", desc = "Toggle Neotree" },
    { "<leader>nt", "<cmd>Neotree toggle position=float<cr>", desc = "Toggle Neotree floating" },
    { "<leader>nb", "<cmd>Neotree buffers toggle position=right<cr>", desc = "Toggle Neotree buffers" },
    -- { "<leader>nt", "<cmd>Neotree<cr>" },
  },
}
