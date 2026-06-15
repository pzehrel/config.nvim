-- 在 Neovim 中渲染图片
-- 依赖终端能力：当前使用 tmux + ghostty，均支持 Kitty Graphics Protocol
-- @see: https://github.com/3rd/image.nvim
return {
  "3rd/image.nvim",
  event = "VeryLazy",
  opts = {
    -- ghostty / kitty / wezterm 均支持 Kitty 图像协议
    -- tmux 3.4+ 配合 allow-passthrough on 可透传该协议
    backend = "kitty",

    -- 使用已安装的 ImageMagick CLI，无需额外安装 magick lua rock
    processor = "magick_cli",

    -- from_url 内部使用异步回调，下载/处理失败时的 error() 无法被外层 pcall 捕获，
    -- 因此先忽略下载错误，避免弹窗打断编辑。
    ignore_download_error = true,

    debug = {
      enabled = true,
      level = "debug",
      file_path = "/tmp/image.nvim.log",
      format = "compact",
    },

    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = true,
        -- 先关闭远程下载：from_url 使用异步回调，下载非图片或处理失败时 error() 无法被捕获，会弹窗报错。
        -- 如需远程图片，可临时开启，但建议只用于可信链接。
        download_remote_images = false,
        only_render_image_at_cursor = true,
        only_render_image_at_cursor_mode = "popup",
        filetypes = { "markdown", "vimwiki" },
        resolve_image_path = function(_, image_path, fallback)
          -- 跳过 data URI / base64 内联图片，避免 magick_cli 把整串当作文件路径打开
          if image_path:match("^data:") or image_path:match(";base64,") then
            return nil
          end
          return fallback(_, image_path)
        end,
      },
    },

    max_width = nil,
    max_height = nil,
    max_width_window_percentage = 100,
    max_height_window_percentage = 50,
    scale_factor = 1.0,
    kitty_direct_chunk_size = 4096,
    window_overlap_clear_enabled = false,
    editor_only_render_when_focused = false,
    tmux_show_only_in_active_window = true,
    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
  },
}
