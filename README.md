# Neovim 快捷键说明

这份配置基于 NvChad，入口文件会先加载 `nvchad.mappings`，再加载本仓库的自定义快捷键。因此这里主要记录本配置新增或覆盖的键位；NvChad 默认键位仍然可用。

`<leader>` 当前设置为空格键。

## 插件功能总览

| 配置文件 | 插件仓库 | 用途 |
| --- | --- | --- |
| `lua/plugins/aerial.lua` | [stevearc/aerial.nvim](https://github.com/stevearc/aerial.nvim) | 代码大纲与符号导航，提供 `{` / `}` 在代码符号间跳转 |
| `lua/plugins/auto-session.lua` | [rmagatti/auto-session](https://github.com/rmagatti/auto-session) | 自动保存和恢复会话，保留 buffer、窗口、tab、折叠等状态 |
| `lua/plugins/conform.lua` | [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) | 代码格式化配置，Lua 使用 `stylua`，前端与 JSON/YAML 使用 `prettier` |
| `lua/plugins/dropbar.lua` | [Bekaboo/dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim) | 顶部 winbar 面包屑导航，支持选择符号和上下文跳转 |
| `lua/plugins/flash.lua` | [folke/flash.nvim](https://github.com/folke/flash.nvim) | 快速跳转与 Treesitter 结构跳转，并自定义跳转高亮 |
| `lua/plugins/gitsigns.lua` | [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git hunk 导航、暂存、重置、预览、blame 与 diff |
| `lua/plugins/lspconfig.lua` | [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP 配置，启用 HTML、CSS、JSON、TypeScript、Vue、Tailwind CSS 支持 |
| `lua/plugins/multicursor.lua` | [jake-stewart/multicursor.nvim](https://github.com/jake-stewart/multicursor.nvim) | 多光标编辑，支持按行、按匹配项和鼠标添加光标 |
| `lua/plugins/nvimtree.lua` | [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | 文件树配置，启用文件夹图标和目录尾部斜杠显示 |
| `lua/plugins/open-in-nvim.lua` | [pzehrel/open-in-nvim](https://github.com/pzehrel/open-in-nvim) | 加载自定义 `open-in-nvim` 插件，用于从外部打开文件到 Neovim |
| `lua/plugins/render-markdown.lua` | [MeanderingProgrammer/render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Markdown 渲染增强，依赖 Treesitter 和 mini.nvim |
| `lua/plugins/schemastore.lua` | [b0o/SchemaStore.nvim](https://github.com/b0o/SchemaStore.nvim) | JSON SchemaStore 支持，为 `jsonls` 提供 Schema |
| `lua/plugins/surround.lua` | [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround) | 环绕符号编辑，例如添加、修改、删除括号或引号 |
| `lua/plugins/treesitter.lua` | [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | 语法解析与高亮，安装 Lua、Markdown、JSON、前端、Vue、Python、Rust 等 parser |
| `lua/plugins/ufo.lua` | [kevinhwang91/nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) | 高级代码折叠，优先使用 Treesitter，回退到缩进折叠 |

其他插件目录文件：

- `lua/plugins/nvim-web-devicons.lua`：保留图标插件的空配置占位，实际图标能力由 [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) 提供。
- `lua/plugins/init.lua`：当前没有启用额外插件，只保留注释示例。

## 基础操作

- 配置文件：`lua/mappings.lua`
- 相关仓库：[NvChad/NvChad](https://github.com/NvChad/NvChad)

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal | `;` | 进入命令行模式，相当于按 `:` |
| Insert | `jk` | 退出插入模式，相当于按 `<Esc>` |

## 删除与修改

- 配置文件：`lua/options.lua`
- 相关仓库：[Neovim](https://github.com/neovim/neovim)

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal / Visual | `d` | 删除内容但不写入默认寄存器，避免覆盖粘贴内容 |
| Normal / Visual | `c` | 修改内容但不写入默认寄存器，避免覆盖粘贴内容 |
| Normal | `x` | 删除单个字符但不写入默认寄存器，避免覆盖粘贴内容 |

## 窗口移动

- 配置文件：`lua/mappings.lua`
- 相关仓库：[NvChad/NvChad](https://github.com/NvChad/NvChad)

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal | `<C-w>j` | 将当前窗口移动到下方 |
| Normal | `<C-w>k` | 将当前窗口移动到上方 |
| Normal | `<C-w>h` | 将当前窗口移动到左侧 |
| Normal | `<C-w>l` | 将当前窗口移动到右侧 |
| Normal | `<C-w>z` | 最大化当前窗口 |

## 禁用默认键位

- 配置文件：`lua/mappings.lua`
- 相关仓库：[NvChad/NvChad](https://github.com/NvChad/NvChad)

| 模式 | 快捷键 | 原用途 |
| --- | --- | --- |
| Normal | `<leader>h` | NvChad 默认终端映射，当前已删除 |
| Normal | `<leader>v` | NvChad 默认终端映射，当前已删除 |
| Normal | `<leader>th` | NvChad 默认主题选择映射，当前已删除 |

## 快速跳转 Flash

- 配置文件：`lua/plugins/flash.lua`
- 插件仓库：[folke/flash.nvim](https://github.com/folke/flash.nvim)

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal / Visual / Operator-pending | `s` | 启动 Flash 跳转，在当前窗口中按标签快速跳到目标位置 |
| Normal / Visual / Operator-pending | `S` | 启动基于 Treesitter 语法节点的 Flash 跳转 |
| Operator-pending | `r` | Remote Flash，用于操作符等待模式下远程选择目标 |
| Visual / Operator-pending | `R` | Treesitter Search，用 Treesitter 结构做搜索和选择 |
| Command-line | `<C-s>` | 切换 Flash 搜索增强 |

## 多光标编辑

- 配置文件：`lua/plugins/multicursor.lua`
- 插件仓库：[jake-stewart/multicursor.nvim](https://github.com/jake-stewart/multicursor.nvim)

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal / Visual | `<Up>` | 在当前光标上一行添加一个多光标 |
| Normal / Visual | `<Down>` | 在当前光标下一行添加一个多光标 |
| Normal / Visual | `<leader><Up>` | 向上跳过一行并添加光标 |
| Normal / Visual | `<leader><Down>` | 向下跳过一行并添加光标 |
| Normal / Visual | `<leader>n` | 向后为下一个匹配的单词或选区添加光标 |
| Normal / Visual | `<leader>s` | 向后跳过下一个匹配项 |
| Normal / Visual | `<leader>N` | 向前为上一个匹配的单词或选区添加光标 |
| Normal / Visual | `<leader>S` | 向前跳过上一个匹配项 |
| Normal | `<C-LeftMouse>` | 用鼠标添加或移除光标 |
| Normal | `<C-LeftDrag>` | 拖拽处理多光标选择 |
| Normal | `<C-LeftRelease>` | 结束鼠标拖拽处理 |
| Normal / Visual | `<C-q>` | 启用或禁用当前多光标 |

多光标存在时会额外启用一层键位：

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal / Visual | `<Left>` | 切换到上一个光标 |
| Normal / Visual | `<Right>` | 切换到下一个光标 |
| Normal / Visual | `<leader>x` | 删除当前主光标 |
| Normal | `<Esc>` | 如果光标被禁用则重新启用，否则清空所有多光标 |

## Git Gitsigns

- 配置文件：`lua/plugins/gitsigns.lua`
- 插件仓库：[lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal | `]c` | 跳到下一个 Git hunk；在 diff 模式下保留 Vim 原生行为 |
| Normal | `[c` | 跳到上一个 Git hunk；在 diff 模式下保留 Vim 原生行为 |
| Normal | `<leader>hs` | 暂存当前 hunk |
| Normal | `<leader>hr` | 重置当前 hunk |
| Visual | `<leader>hs` | 暂存选中范围内的 hunk |
| Visual | `<leader>hr` | 重置选中范围内的 hunk |
| Normal | `<leader>hS` | 暂存整个缓冲区 |
| Normal | `<leader>hR` | 重置整个缓冲区 |
| Normal | `<leader>hp` | 弹窗预览当前 hunk |
| Normal | `<leader>hi` | 行内预览当前 hunk |
| Normal | `<leader>hb` | 显示当前行完整 blame 信息 |
| Normal | `<leader>hd` | 对当前文件执行 diff |
| Normal | `<leader>hD` | 与上一次提交版本执行 diff |
| Normal | `<leader>hQ` | 将所有 hunk 放入 quickfix 列表 |
| Normal | `<leader>hq` | 将当前文件 hunk 放入 quickfix 列表 |
| Normal | `<leader>tb` | 切换当前行 blame 显示 |
| Normal | `<leader>tw` | 切换 word diff 显示 |
| Operator-pending / Visual | `ih` | 选择当前 hunk 文本对象 |

## 代码结构与面包屑

- 配置文件：`lua/plugins/dropbar.lua`、`lua/plugins/aerial.lua`
- 插件仓库：[Bekaboo/dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim)、[stevearc/aerial.nvim](https://github.com/stevearc/aerial.nvim)

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal | `<leader>;` | 在 winbar 面包屑中选择符号 |
| Normal | `[;` | 跳到当前上下文的起始位置 |
| Normal | `];` | 选择下一个上下文 |
| Normal | `{` | 跳到上一个 Aerial 代码符号 |
| Normal | `}` | 跳到下一个 Aerial 代码符号 |

## 说明

- 这份 README 整理了 `lua/plugins/` 下的插件用途，以及仓库中显式定义或删除的快捷键。
- 如果要查看运行时最终生效的所有键位，可以在 Neovim 中执行 `:map`、`:nmap`、`:imap`，或使用 which-key 的提示面板查看 NvChad 默认键位。
