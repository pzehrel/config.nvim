
-- 鼠须管（Squirrel）自动中英文切换
-- @see: https://github.com/pzehrel/squirrel-auto-switch.nvim
return {
  "pzehrel/squirrel-auto-switch.nvim",
  lazy = false,
  opts = {
    -- Squirrel CLI 路径
    executable = "/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel",

    -- macOS 中的 Squirrel 输入源 ID
    input_source = "im.rime.inputmethod.Squirrel.Hans",

    -- 设置 ascii/nascii 前自动选择 Squirrel 输入源
    auto_activate = true,

    -- 第一次进入 Insert 时使用的状态："ascii" | "nascii" | "english" | "chinese"
    default_insert_state = "ascii",

    -- 处理 FocusGained／FocusLost
    sync_on_focus = true,
  },
}
