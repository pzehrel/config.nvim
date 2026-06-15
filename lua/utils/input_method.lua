
-- 自动输入法切换：进入 Insert 模式恢复上次 Insert 中的输入法，离开 Insert 模式切英文
-- 启动或重新获得焦点时，根据当前模式恢复输入法状态
-- 依赖 Squirrel (鼠须管) CLI，详见 docs/auto-input-methods.md
local squirrel = require "utils.squirrel"

local group = vim.api.nvim_create_augroup("SquirrelInputMethod", { clear = true })

-- 记录上一次离开 Insert 模式时的输入法状态："ascii" | "nascii" | nil
local last_insert_state = nil

-- 恢复到上一次 Insert 模式的输入法状态，未知时默认中文；强制 set 以产生状态提醒
local function restore_insert_input_method()
  if last_insert_state == "ascii" then
    squirrel.to_english(true)
  else
    squirrel.to_chinese(true)
  end
end

-- 根据当前模式同步输入法
local function sync_input_method()
  local mode = vim.api.nvim_get_mode().mode

  if mode:sub(1, 1) == "i" then
    restore_insert_input_method()
  else
    squirrel.to_english()
  end
end

-- 进入 Insert 模式时恢复上次的输入法状态
vim.api.nvim_create_autocmd("InsertEnter", {
  group = group,
  callback = restore_insert_input_method,
})

-- 离开 Insert 模式时切到英文，并记录离开前的输入法状态
vim.api.nvim_create_autocmd("InsertLeave", {
  group = group,
  callback = function()
    last_insert_state = squirrel.get_state()
    squirrel.to_english()
  end,
})

-- 启动时切到英文（默认 Normal 模式）
vim.api.nvim_create_autocmd("VimEnter", {
  group = group,
  callback = function()
    squirrel.to_english()
  end,
})

-- 重新获得焦点时根据当前模式同步输入法
vim.api.nvim_create_autocmd("FocusGained", {
  group = group,
  callback = sync_input_method,
})
