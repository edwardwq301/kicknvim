local vim=vim

vim.o.title = true
-- 设置 Neovim 窗口的标题字符串为当前缓冲区文件的目录名
vim.o.titlestring = 'nvim %{expand("%:p:h:t")}'
vim.opt.hlsearch = true
-- split window setting
vim.o.splitbelow = true
vim.o.splitright = true

vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 1
vim.o.foldnestmax = 4
vim.o.foldenable = true
vim.opt.foldmethod = 'indent' 

-- wrap line when too long to display
vim.o.wrap = true
vim.o.smoothscroll = true

if vim.g.is_not_large() then
    vim.o.undofile = true
end


vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
