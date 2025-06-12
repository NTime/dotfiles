return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({ -- enable syntax highlighting
      highlight = {
        enable = true,
        disable = { "css" }
      },
      -- enable indentation
      indent = { enable = true, disable = { "python", "css", "yaml" } },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "rust",
        "r",
        "java",
        "python",
        "bash",
        "c",
        "lua",
        "vim",
        "vimdoc",
        "dockerfile",
        "gitignore",
        "query",
      },
      ignore_install = { "" },     -- List of parsers to ignore installing
      sync_install = false,        -- install languages synchronously (only applied to `ensure_installed`)
    })

    -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
    require('ts_context_commentstring').setup {}
  end,
}
