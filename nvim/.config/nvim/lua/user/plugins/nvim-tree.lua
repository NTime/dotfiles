return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local nvim_tree = require("nvim-tree")

    local keymap = vim.keymap.set

    -- Open/Close nvim-tree
    keymap("n", "<leader>r", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })

    -- Buffer keymaps
    local function on_attach(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom keymaps
      keymap('n', 'l', api.node.open.edit, opts('Open'))
      keymap('n', '<CR>', api.node.open.edit, opts('Open'))
      keymap('n', 'o', api.node.open.edit, opts('Open'))
      keymap('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
      keymap('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
    end

    -- nvim-tree config
    nvim_tree.setup({
      on_attach = on_attach,
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        -- update_root = true, -- update cwd to focused buffer
      },
      renderer = {
        root_folder_label = ":t",
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "",
              untracked = "U",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      view = {
        width = 30,
        side = "left",
      },
    })
  end,
}
