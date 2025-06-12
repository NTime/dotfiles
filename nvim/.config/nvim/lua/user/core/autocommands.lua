vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('_markdown', { clear = true }),
  pattern = { "markdown", "rmarkdown" },
  callback = function()
    vim.opt.wrap = true
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when copying text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    ---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
    if client.supports_method('textDocument/formatting') then
      -- Format the current buffer on save
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({bufnr = args.buf, id = client.id})
        end,
      })
    end
  end,
})
