return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPre", "BufNewFile" },
  config = function ()
    local ibl = require("ibl")

    ibl.setup({
      indent = {
        char = "▏",
        tab_char = "▏",
      },
      scope = {enabled = false},
      exclude = {
        filetypes = {
          "help",
          "dashboard",
          "NvimTree",
          "neo-tree",
          "Trouble",
          "trouble",
          "toggleterm",
          "mason",
          "notify",
          "lazy",
          "alpha"
        },
      },
    })
  end
}
