return {
  "luisiacc/gruvbox-baby",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    vim.g.gruvbox_baby_background_color = "dark"
    vim.cmd([[colorscheme gruvbox-baby]])
  end,
}
