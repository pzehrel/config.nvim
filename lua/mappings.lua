require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local del = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


-- 窗口移动
map("n", "<C-w>j", "<C-w><S-j>", { desc = "Move to window below" })
map("n", "<C-w>k", "<C-w><S-k>", { desc = "Move to window above" })
map("n", "<C-w>h", "<C-w><S-h>", { desc = "Move to left window" })
map("n", "<C-w>l", "<C-w><S-l>", { desc = "Move to right window" })


-- 最大化窗口
map("n", "<C-w>z", "<cmd>wincmd _ | wincmd |<CR>", { desc = "Maximize window" })

-- 删除 NvChad 默认终端映射
del("n", "<leader>h")
del("n", "<leader>v")
-- 新终端映射: leader + tv / th
map("n", "<leader>tv", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical term" })
map("n", "<leader>th", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

-- 删除 NvChad 默认的 <leader>th（themes）
del("n", "<leader>th")
-- theme 切换映射到新键位 leader-mt（原 <leader>th 已被终端占用）
map("n", "<leader>mt", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })


-- 代码大纲窗口插件
map("n", "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "Aerial: toggle outline" })

-- 聚焦或打开 quickfix 窗口
map("n", "<leader>q", function()
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd(win.winnr .. "wincmd w")
      return
    end
  end
  vim.cmd "copen"
end, { desc = "Focus or open quickfix" })



-- diffview.nvim: git diff / merge / file history
map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Diffview: open git diff" })
map("n", "<leader>gD", "<cmd>DiffviewOpen -- %<CR>", { desc = "Diffview: open current file diff" })
map("n", "<leader>gh", "<cmd>DiffviewFileHistory<CR>", { desc = "Diffview: open file history" })
map("n", "<leader>gH", "<cmd>DiffviewFileHistory %<CR>", { desc = "Diffview: open current file history" })
map("n", "<leader>gq", "<cmd>DiffviewClose<CR>", { desc = "Diffview: close" })
