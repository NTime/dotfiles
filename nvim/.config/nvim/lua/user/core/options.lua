local options = {
  autochdir = false,                       -- changes cwd to the current focused window file
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore uppercase letters in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim. 'a' means for all modes
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- show things like -- INSERT --
  showtabline = 0,                         -- show tabs only if there are at least two tab pages
  tabline = "%m %t",                       -- if 'showtabline' available, shows name of file in the tabline
  smartcase = true,                        -- makes our search ignore uppercase letters unless the search term has an uppercase letter
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  softtabstop = 4,
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  tabstop = 4,                             -- insert 2 spaces for a tab
  cursorline = false,                      -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  linebreak = true,                        -- companion to wrap, don't split words
  breakindent = true,                      -- preserve the indentation of a virtual line
  scrolloff = 15,                          -- minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 10,                      -- minimal number of screen columns either side of cursor if wrap is `false`
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
}


for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.shortmess:append "c"                           -- don't give |ins-completion-menu| messages
vim.opt.formatoptions:remove({ "c", "r", "o" })        -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
