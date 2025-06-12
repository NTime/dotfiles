return {
  "echasnovski/mini.files",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local mini_files = require("mini.files")

    vim.keymap.set("n", "<leader>e", function()
      local buf_name = vim.api.nvim_buf_get_name(0)
      local dir_name = vim.fn.fnamemodify(buf_name, ":p:h")
      if vim.fn.filereadable(buf_name) == 1 then
        -- Pass the full file path to highlight the file
        require("mini.files").open(buf_name, true)
      elseif vim.fn.isdirectory(dir_name) == 1 then
        -- If the directory exists but the file doesn't, open the directory
        require("mini.files").open(dir_name, true)
      else
        -- If neither exists, fallback to the current working directory
        require("mini.files").open(vim.uv.cwd(), true)
      end
    end)

    -- Open cwd
    vim.keymap.set("n", "<leader>E", function()
      mini_files.open(vim.uv.cwd(), true)
    end)

    -- Set focused directory as current working directory
    local set_cwd = function()
      local path = (MiniFiles.get_fs_entry() or {}).path
      if path == nil then return vim.notify('Cursor is not on valid entry') end
      vim.fn.chdir(vim.fs.dirname(path))
    end

    -- Yank in register full path of entry under cursor
    local yank_path = function()
      local path = (MiniFiles.get_fs_entry() or {}).path
      if path == nil then return vim.notify('Cursor is not on valid entry') end
      vim.fn.setreg(vim.v.register, path)
    end

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local b = args.data.buf_id
        vim.keymap.set('n', 'gt', set_cwd, { buffer = b, desc = 'Set cwd' })
        vim.keymap.set('n', 'gy', yank_path, { buffer = b, desc = 'Yank path' })
      end,
    })

    mini_files.setup({
      mappings = {
        close       = 'q',
        go_in       = 'l',
        go_in_plus  = '<CR>',
        go_out      = 'H',
        go_out_plus = 'h',
        mark_goto   = "'",
        mark_set    = 'm',
        reset       = '<BS>',
        reveal_cwd  = '.',
        show_help   = 'g?',
        synchronize = 's',
        trim_left   = '<',
        trim_right  = '>',
      },
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 30,
      },
      options = {
        use_as_default_explorer = false,
        permanent_delte = true,
      },
    })
  end
}
