-- This is the custom lua config file that is not taken from any pre set config file.
-- Write additional config/ packages here that

local map = vim.api.nvim_set_keymap

-- Set LoC to be relative and show current line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Set default tab value to be 4(?) spaces
-- @deprecated The following is already taken care of tpope/vim-sleuth
--
-- vim.opt.tabstop = 8
-- vim.opt.softtabstop = 8
-- vim.opt.expandtab = true
-- vim.opt.shiftwidth = 4
-- vim.opt.smarttab = true

-- Make shift round to the nearest tab stop
vim.opt.shiftround = true

vim.opt.virtualedit = 'block'
vim.opt.backupcopy = 'yes'

-- Make navigation keys treat wrapped lines as separate lines
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, silent = false, expr = true })
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, silent = false, expr = true })
map('n', '<C-P>', ':Format<CR>', { noremap = true, silent = false })

vim.keymap.set(
  'n',
  '<leader>ol',
  function() require("nvim-navbuddy").open() end,
  {
    noremap = true,
    silent = false,
    desc = '[ol] Open list of variables and functions',
  }
)

vim.keymap.set(
  'n',
  '<leader>gbl',
  ':Git blame -w<CR>',
  {
    noremap = false,
    silent = false,
    desc = '[gbl] Git blame the current line',
  }
)

-- Yank entire buffer
vim.keymap.set("n", "<leader>Y", ":%y+<CR>")

-- Put text from default register to a new line
vim.keymap.set("n", "gp", ":pu<CR>")
vim.keymap.set("n", "gP", ":pu!<CR>")

-- Taken from Jess Archer
-- https://github.com/jessarcher/dotfiles/blob/master/nvim/lua/user/keymaps.lua

-- Paste replace selection without copying it
vim.keymap.set('v', 'p', '"_dP')

-- Add common end character
vim.keymap.set("n", ";;", "A;<Esc>")
vim.keymap.set("n", ",,", "A,<Esc>")
-- vim.keymap.set("i", ";;", "<Esc>A;<Esc>")
-- vim.keymap.set("i", ",,", "<Esc>A,<Esc>")

-- Resize windows with arrows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Copy current buffer relative path
vim.keymap.set(
  "n",
  "<leader>dr",
  function () vim.fn.setreg('+', vim.fn.expand('%')) end,
  { desc = 'Copy [D]ocument [R]elative path' }
)

-- Copy current buffer absolute path
vim.keymap.set(
  "n",
  "<leader>da",
  function () vim.fn.setreg('+', vim.fn.expand('%:p')) end,
  { desc = 'Copy [D]ocument [A]bsolute path' }
)

-- Unmap the arrow keys to force learning and using Vim navigation keys
local newbieCrutches = true

if not newbieCrutches then
  for _, mode in pairs({'n', 'i', 'v', 'x'}) do
    for _, key in pairs({ '<Up>', '<Down>', '<Left>', '<Right>' }) do
      map(mode, key, '<Nop>', {})
    end
  end
end

-- Go to last location when opening a buffer
local JumpToLastKnownPositionOnBufferRead = vim.api.nvim_create_augroup("JumpToLastKnownPositionOnBufferRead", { clear = true })
vim.api.nvim_create_autocmd(
  'BufReadPost',
  {
    command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]],
    group = JumpToLastKnownPositionOnBufferRead
  }
)

-- Restore cursor to | upon exiting nvim
-- @todo Checkout alacritty Vim option on its config. This might be an alacritty only issue
local RestoreCursorShapeOnExit = vim.api.nvim_create_augroup("RestoreCursorShapeOnExit", { clear = true })
vim.api.nvim_create_autocmd(
  'VimLeave',
  {
    command = [[ set guicursor=a:ver25 ]],
    group = RestoreCursorShapeOnExit
  }
)
