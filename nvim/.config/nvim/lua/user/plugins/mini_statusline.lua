return {
  "echasnovski/mini.statusline",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local statusline = require("mini.statusline")
    statusline.setup()
  end
}
