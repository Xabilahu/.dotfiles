-- This is where you custom modules and plugins goes.
-- See the wiki for a guide on how to extend NvChad

-- Indentation
-- vim.opt.autoindent = true
-- vim.opt.shiftround = true
-- 
-- -- Search
-- vim.opt.hlsearch = false
-- vim.opt.incsearch = true
-- 
-- -- Performance
-- vim.opt.lazyredraw = true
-- 
-- -- Text Rendering
-- vim.opt.encoding = "utf-8"
-- vim.opt.scrolloff = 10
-- vim.opt.sidescrolloff = 10
-- vim.opt.wrap = false
-- vim.opt.colorcolumn = 80
-- 
-- -- User Interface 
-- vim.opt.cursorline = true
-- 
-- -- Miscellaneous
-- vim.opt.confirm = true
-- vim.opt.spell = true
-- 
-- vim.g.diagnostics_visible = true

-- -- Autocmds
-- vim.cmd [[ autocmd BufNewFile,BufRead *.c,*.h,*.cpp,*.hpp setlocal shiftwidth=2 tabstop=2 ]]
-- vim.cmd [[ autocmd BufWritePost * silent! Neoformat ]]

local map = require("core.utils").map

map("n", "<leader>q", ":silent! :NvimTreeClose <CR>:q <CR>");
map("n", "<leader>qq", ":silent! :NvimTreeClose <CR>: q! <CR>");
map("n", "<leader>wq", ":silent! :NvimTreeClose <CR>:wq <CR>");
map("n", "<leader>lp", ":LspStop <CR>");
map("n", "<leader>ls", ":LspStart <CR>");
map("n", "<leader>m", ":Telescope marks <CR>");
map("n", "<leader>u", ":PackerUpdate <CR>");
map("n", "<leader>fm", ":Neoformat <CR>");

-- -- Behave like vim
map("n", "Y", "y$");

-- Keep Line centered
map("n", "n", "nzzzv");
map("n", "N", "Nzzzv");
map("n", "J", "mzJ`z");

-- Move text
map("v", "J", ":m '>+1<CR>gv=gv");
map("v", "K", ":m '<-2<CR>gv=gv");
map("i", "<C-j>", "<esc>:m .+1<CR>==");
map("i", "<C-k>", "<esc>:m .-2<CR>==");
map("n", "<leader>j", ":m .+1<CR>==");
map("n", "<leader>k", ":m .-2<CR>==");
