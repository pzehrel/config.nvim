
-- Squirrel (鼠须管) 输入法 CLI 封装
-- 提供 Nvim 模式切换时的输入法自动切换支持

local M = {}

local SQUIRREL_CLI = "/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel"

-- 缓存当前输入法状态: "ascii" | "nascii" | nil
local cached_state = nil

-- Squirrel CLI 是否可用，nil 表示尚未检测
local is_available = nil

---检测 Squirrel CLI 是否可用
---@return boolean
local function check_available()
  if is_available ~= nil then
    return is_available
  end

  is_available = vim.fn.executable(SQUIRREL_CLI) == 1
  return is_available
end

---执行 Squirrel CLI 命令
---@param args string[]
---@return string|nil output 命令输出（已 trim），失败返回 nil
local function exec(args)
  if not check_available() then
    return nil
  end

  local cmd = vim.list_extend({ SQUIRREL_CLI }, args)
  local ok, result = pcall(vim.fn.system, cmd)

  if not ok or vim.v.shell_error ~= 0 then
    return nil
  end

  local output = result:gsub("%s+$", "")
  return output
end

---查询并刷新当前输入法状态
---@return "ascii"|"nascii"|nil
function M.get_state()
  local output = exec({ "--getascii" })

  if output == "ascii" or output == "nascii" then
    cached_state = output
    return output
  end

  return nil
end

---切换到中文输入法（nascii），若缓存已命中则跳过
---@param force? boolean 为 true 时跳过缓存检查，强制调用 CLI
function M.to_chinese(force)
  if not force and cached_state == "nascii" then
    return
  end

  exec({ "--nascii" })
  cached_state = "nascii"
end

---切换到英文输入法（ascii），若缓存已命中则跳过
---@param force? boolean 为 true 时跳过缓存检查，强制调用 CLI
function M.to_english(force)
  if not force and cached_state == "ascii" then
    return
  end

  exec({ "--ascii" })
  cached_state = "ascii"
end

return M
