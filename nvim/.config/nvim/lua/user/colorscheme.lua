vim.g.gruvbox_baby_background_color = 'dark'
local colorscheme="gruvbox-baby"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
