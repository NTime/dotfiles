return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },

  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)                   -- go to declaration
        keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)                    -- Jumps to the definition of the symbol under the cursor
        keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)                          -- show documentation for what is under cursor
        keymap.set("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)                -- show lsp implementations
        keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)                    -- show definition, references
        keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)                 -- show diagnostics for line
        keymap.set("n", "gL", "<cmd>Telescope diagnostics bufnr=0<cr>", opts)                   -- show diagnostics for file via Telescope
        keymap.set("n", "[d", "<cmd>lua vim.diagnostic.jump({count=-1, float=true})<cr>", opts) -- jump to previous diagnostic in buffer
        keymap.set("n", "]d", "<cmd>lua vim.diagnostic.jump({count=1, float=true})<cr>", opts)  -- jump to next diagnostic in buffer
        keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
        keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)           -- see available code actions, in visual mode will apply to selection
        keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)                -- smart rename
        keymap.set("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
        keymap.set("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.diagnostic.config({
      virtual_text = false, -- Disable noisy error messages
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.HINT] = "󰠠",
          [vim.diagnostic.severity.INFO] = "",
        },
      },
      underline = true,
      update_in_insert = true,
      severity_sort = true,
      float = {
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
      },
    })

    vim.lsp.config("*", {
      capabilities = capabilities,
    })
  end,
}
