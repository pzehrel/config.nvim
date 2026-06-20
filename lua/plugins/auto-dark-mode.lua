
-- 自动切换深色模式
-- @see: https://github.com/f-person/auto-dark-mode.nvim
-- @see: https://github.com/NvChad/NvChad/issues/2721
return {
  "f-person/auto-dark-mode.nvim",
  lazy = false,
  config = function()
    require("auto-dark-mode").setup({
      update_interval = 3000,
      set_dark_mode = function()
        require("utils.theme").set_theme("tokyodark")
      end,
      set_light_mode = function()
        require("utils.theme").set_theme("flexoki-light")
      end,
    })
  end,
}
