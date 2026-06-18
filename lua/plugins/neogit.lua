
-- Git 交互面板（magit 风格）
-- 默认快捷键见 :help neogit-mappings
-- @see: https://github.com/NeogitOrg/neogit
return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = "Neogit",
  keys = {
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit: 打开状态面板" },
    { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Neogit: 提交" },
  },
  config = true,
}
