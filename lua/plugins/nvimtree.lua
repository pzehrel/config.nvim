-- NvimTree 配置：启用基于 nvim-web-devicons 的文件夹图标
-- 让 src、components 等常见文件夹显示类似 VSCode 的特定图标
-- @see: https://github.com/nvim-tree/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    view = {
      width = 40,
    },
    git = {
      ignore = false,
    },
    renderer = {
      add_trailing = true,
      highlight_git = "all",
      icons = {
        git_placement = "signcolumn",
        web_devicons = {
          folder = {
            enable = true,
          },
        },
        glyphs = {
          git = {
            unstaged  = "M",
            staged    = "A",
            unmerged  = "C",
            renamed   = "R",
            untracked = "U",
            deleted   = "D",
            ignored   = "",
          },
        },
      },
    },
  },
}

