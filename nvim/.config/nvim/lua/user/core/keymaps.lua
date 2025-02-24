local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

keymap("n", "<leader>\\", function() -- Change cwd to the current file and open terminal
  vim.cmd.cd("%:p:h")
  vim.cmd.term()
end)

keymap("t", "<esc>", "<C-\\><C-N>", term_opts)

keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts) -- Nvim-tree
keymap("n", "<leader>w", "<cmd>w!<CR>", opts)
keymap("n", "<leader>q", "<cmd>q!<CR>", opts)
keymap("n", "<leader>c", "<cmd>bdelete!<CR>", opts)   -- Close Buffer
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts) -- No search highlight

--Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)  -- Fuzzy find files in cwd
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)   -- Fuzzy find help
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", opts)    -- Fuzzy find recent files
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)     -- Buffers
keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opts)   -- Find string in cwd
keymap("n", "<leader>fg", "<cmd>Telescope grep_string<cr>", opts) -- Find string under cursor in cwd
keymap("n", "<leader>fm", "<cmd>Telescope man_pages<cr>", opts)   -- Find string in man pages
-- Telescope searches only in vim cwd. Use it to change the search scope
keymap("n", "<leader>fd", "<cmd>cd %:p:h<cr>", opts)              -- Changes vim cwd to the current focused file on window
