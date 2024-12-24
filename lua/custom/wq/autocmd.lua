local vim = vim

local autocmds = {}

-- 当缓冲区窗口离开时，保存视图
table.insert(autocmds, vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
    callback = function()
        vim.g.exec_on_small(vim.cmd, "silent! mkview") -- 静默保存视图
    end,
}))

-- 当缓冲区窗口进入时，加载视图
table.insert(autocmds, vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    callback = function()
        vim.g.exec_on_small(vim.cmd, "silent! loadview") -- 静默加载视图
    end,
}))

-- 在写入文件之前格式化
table.insert(autocmds, vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = vim.g.format,
}))

-- 当窗口大小改变时，均匀调整所有窗口的大小
table.insert(autocmds, vim.api.nvim_create_autocmd({ "VimResized" }, {
    callback = function()
        local current_tab = vim.fn.tabpagenr() -- 获取当前标签页
        vim.cmd("tabdo wincmd =") -- 均匀调整窗口
        vim.cmd("tabnext " .. current_tab) -- 返回当前标签页
    end,
}))

-- 在离开插入模式或文本改变时，自动保存
-- table.insert(autocmds, vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
--     pattern = { "*" },
--     command = "silent! wa", -- 静默保存所有缓冲区
-- }))

-- 针对特定文件类型设置缩进
table.insert(autocmds, vim.api.nvim_create_autocmd("FileType", {
    pattern = { "yml", "yaml", "json", "html", "css", "javascript", "typescript", "sh", "sql", "vue", "markdown" },
    callback = function()
        vim.opt_local.shiftwidth = 2 -- 设置缩进宽度
        vim.opt_local.tabstop = 2 -- 设置制表符宽度
        vim.opt_local.softtabstop = 2 -- 设置软制表符宽度
    end,
}))

-- 进入缓冲区时，切换到项目根目录
table.insert(autocmds, vim.api.nvim_create_autocmd("BufEnter", {
    callback = function(ctx)
        local root =
            vim.fs.root(ctx.buf, { ".git", ".svn", "Makefile", "mvnw", "package.json", "go.mod", "Cargo.toml" })
        if root and root ~= "." and root ~= vim.fn.getcwd() then
            vim.cmd.cd(root) -- 切换到项目根目录
        end
    end,
}))

-- 用户自定义事件处理
table.insert(autocmds, vim.api.nvim_create_autocmd("User", {
    pattern = { "VeryLazy" },
    callback = function()
        local _trigger = function()
            vim.api.nvim_exec_autocmds("User", { pattern = "Lazyest" })
        end

        -- BufRead will not avoid plugin loading in dashboard
        if vim.bo.filetype == "dashboard" then
            vim.api.nvim_create_autocmd("BufRead", {
                once = true,
                callback = _trigger,
            })
        else
            vim.g.exec_on_small(_trigger)
        end
    end,
}))

return autocmds
