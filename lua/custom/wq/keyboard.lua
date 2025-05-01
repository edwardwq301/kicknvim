-- 智能换行移动（j/k 在长行时按屏幕行移动）
vim.keymap.set({ 'n', 'v' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Move down (line-wrap aware)" })
vim.keymap.set({ 'n', 'v' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Move up (line-wrap aware)" })

-- 行首/行尾
vim.keymap.set({ 'n', 'v' }, 'L', 'g_', { desc = "Go to line end" })
vim.keymap.set({ 'n', 'v' }, 'H', '^', { desc = "Go to line start" })

-- 页面滚动
local half_page = math.floor(vim.fn.winheight(0) / 2)
vim.keymap.set({ 'n', 'v' }, '<C-u>', half_page .. '<C-u>', { desc = "Scroll half page up" })
vim.keymap.set({ 'n', 'v' }, '<C-d>', half_page .. '<C-d>', { desc = "Scroll half page down" })

-- 编辑操作
vim.keymap.set('i', '<C-BS>', '<C-w>', { desc = "Delete previous word" })
-- 缩进后保持选中
vim.keymap.set('v', '>', '>gv', { desc = "Indent and keep selection" })
vim.keymap.set('v', '<', '<gv', { desc = "Unindent and keep selection" })

--  窗口管理
vim.keymap.set('n', 's|', '<cmd>vsp<CR>', { desc = "Vertical split" })
vim.keymap.set('n', 's-', '<cmd>sp<CR>', { desc = "Horizontal split" })
vim.keymap.set('n', 'sc', '<C-w>c', { desc = "Close current window" })
vim.keymap.set('n', 'so', '<C-w>o', { desc = "Close other windows" })

-- 命令模式
vim.keymap.set({ 'n', 'v' }, ';', ':', { desc = "Enter command mode" })

-- 折叠
vim.keymap.set('n', '<CR>', 'za', { desc = "Toggle fold" })
vim.keymap.set('n', '<2-LeftMouse>', 'za', { desc = "Toggle fold (double-click)" })

-- 注释
vim.keymap.set({ 'n', 'v' }, '<C-/>', 'gc', { remap = true, desc = "Toggle comment" })
