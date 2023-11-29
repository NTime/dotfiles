return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPre", "BufNewFile" },
  config = function ()
    local ibl = require("ibl")

    ibl.setup({
      exclude = {
        filetypes = { "terminal", "nofile" },
        buftypes = {
          "help",
          "startify",
          "dashboard",
          "neogitstatus",
          "NvimTree",
          "Trouble"
        },
      },
      indent = { char = "▏" },
      whitespace = { remove_blankline_trail = true },
    })
  end
}
