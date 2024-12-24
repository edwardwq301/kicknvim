local vim = vim
local opt = {
    noremap = true,
    silent = true
}

local Base = {
    movement = {{'n', '<ESC>', '<cmd>nohlsearch<CR>', {
        desc = "cancel highlight result"
    }}, {{{"n", "v"}, "j", "v:count == 0 ? 'gj' : 'j'", {
        expr = true,
        silent = true,
        desc = "go to next wrapline"
    }}}, {{"n", "v"}, "k", "v:count == 0 ? 'gk' : 'k'", {
        expr = true,
        silent = true,
        desc = "go to previous wrapline"
    }}, {{"n", "v"}, "L", "g_", {
        desc = "go to line end"
    }}, {{"n", "v"}, "H", "^", {
        desc = "go to line begin"
    }}},
    -- page scroll
    page = {{{"n", "v"}, "<C-u>", math.floor(vim.fn.winheight(0) / 2) .. "<C-u>", {
        desc = "scroll half page forward"
    }}, {{"n", "v"}, "<C-d>", math.floor(vim.fn.winheight(0) / 2) .. "<C-d>", {
        desc = "scroll half page backward"
    }}},

    edit = {{"i", "<C-BS>", "<C-W>", {
        desc = "delete word forward"
    }}, {"n", "yw", "yiw", {
        desc = "copy the word where cursor locates"
    }}, {"n", "<C-S-v>", "<C-v>", {
        desc = "start visual mode blockwise"
    }}, {"v", ">", ">gv", {
        desc = "indent while keeping virtual mode after "
    }}, {"v", "<", "<gv", {
        desc = "indent while keeping virtual mode after "
    }}},
    -- todo window split dont work
    windows = {{'n', 's|', ':vsp<CR>', {
        silent = true,
        desc = "split horizon"
    }}, {'n', 's-', ':sp<CR>', {
        silent = true,
        desc = "split vertical"
    }}, {'n', 'sc', '<C-w>c', {
        silent = true,
        desc = "close current window"
    }}, {'n', 'so', '<C-w>o', {
        silent = true,
        desc = "close other window"
    }}, {'n', '<A-j>', '<C-w>j', {
        silent = true,
        desc = "move to  down window"
    }}, {'n', '<A-k>', '<C-w>k', {
        silent = true,
        desc = "move to up window"
    }}, {'n', '<A-l>', '<C-w>l', {
        silent = true,
        desc = "move to left window"
    }}, {'n', '<A-h>', '<C-w>h', {
        silent = true,
        desc = "move to right window"
    }}},
    cmd = {{{"n", "v"}, ";", ":", {
        nowait = true,
        desc = "enter commandline mode"
    }}, {"n", "g=", vim.g.format, {
        desc = "format document"
    }}, {'t', '<Esc><Esc>', '<C-\\><C-n>', {
        desc = 'Exit terminal mode'
    }}},

    fold = {{"n", "<CR>", "za", {
        desc = "toggle fold"
    }}, {"n", "<2-LeftMouse>", "za", {
        desc = "toggle fold"
    }}},
    -- todo dont work comment
    comment = {{"v", "<C-/>", "gc", {
        desc = "comment",
        remap = true,
        silent = true
    }}, {"v", "<C-_>", "gc", {
        desc = "comment",
        remap = true,
        silent = true
    }}, {"n", "<C-/>", "gcc", {
        desc = "comment",
        remap = true,
        silent = true
    }}, {"n", "<C-_>", "gcc", {
        desc = "comment",
        remap = true,
        silent = true
    }}}
}

vim.g.register_keymap(Base)
