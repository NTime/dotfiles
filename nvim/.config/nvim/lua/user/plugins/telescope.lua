return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")
    local opts = { noremap = true, silent = true }
    local keymap = vim.keymap.set

    keymap("n", "<leader>ff", builtin.find_files, opts)  -- Fuzzy find files in cwd
    keymap("n", "<leader>fh", builtin.help_tags, opts)   -- Fuzzy find help
    keymap("n", "<leader>fr", builtin.oldfiles, opts)    -- Fuzzy find recent files
    keymap("n", "<leader>fb", builtin.buffers, opts)     -- Buffers
    keymap("n", "<leader>fs", builtin.live_grep, opts)   -- Find string in cwd
    keymap("n", "<leader>fg", builtin.grep_string, opts) -- Find string under cursor in cwd
    keymap("n", "<leader>fm", builtin.man_pages, opts)   -- Find string in man pages
    keymap("n", "<leader>fc", function()                 -- Find in nvim config directory
      builtin.find_files { cwd = vim.fn.stdpath("config") }
    end, opts)

    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<C-p>"] = actions.move_selection_previous, -- move to prev result
            ["<C-n>"] = actions.move_selection_next,     -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-d>"] = actions.delete_buffer,
            ["jk"] = actions.close,
            ["kj"] = actions.close,
          },
        },
      },
    })

    telescope.load_extension("fzf")
  end,
}
