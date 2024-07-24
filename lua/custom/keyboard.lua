-- [[ Basic Keymaps ]]
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- See `:help wincmd` for a list of all window commands
local opt = { noremap = true, silent = true }
-- vim.keymap.set("n", "<C-u>", "9k", opt)
-- vim.keymap.set("n", "<C-d>", "9j", opt)

vim.keymap.set('v', '<', '<gv', opt)
vim.keymap.set('v', '>', '>gv', opt)
-- Keybinds to split window and open/close window
vim.keymap.set('n', 's|', ':vsp<CR>', opt)
vim.keymap.set('n', 's-', ':sp<CR>', opt)
vim.keymap.set('n', 'sc', '<C-w>c', opt) -- close now window
vim.keymap.set('n', 'so', '<C-w>o', opt) -- close others

-- Use ALT+<hjkl> to switch between windows
vim.keymap.set('n', '<A-j>', '<C-w>j', opt)
vim.keymap.set('n', '<A-k>', '<C-w>k', opt)
vim.keymap.set('n', '<A-l>', '<C-w>l', opt)
vim.keymap.set('n', '<A-h>', '<C-w>h', opt)

vim.keymap.set('n', '<C-h>', ':tablast<CR>', opt)
vim.keymap.set('n', '<C-l>', ':tabNext<CR>', opt)
--vim.keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
--vim.keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })


-- nvimTree
vim.keymap.set('n', '<A-m>', ':NvimTreeToggle<CR>', opt)