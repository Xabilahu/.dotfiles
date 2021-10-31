-- This is where you custom modules and plugins goes.
-- See the wiki for a guide on how to extend NvChad

local hooks = require "core.hooks"

-- Indentation
vim.opt.autoindent = true
vim.opt.shiftround = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Performance
vim.opt.lazyredraw = true

-- Text Rendering
vim.opt.encoding = "utf-8"
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.wrap = false
vim.opt.colorcolumn = "81"

-- User Interface 
vim.opt.cursorline = true

-- Miscellaneous
vim.opt.confirm = true
vim.opt.spell = true

vim.g.diagnostics_visible = true

function _G.toggle_diagnostics()
  if vim.g.diagnostics_visible then
    vim.g.diagnostics_visible = false
    vim.lsp.diagnostic.clear(0)
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
    print('Diagnostics are hidden')
  else
    vim.g.diagnostics_visible = true
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
      }
    )
    print('Diagnostics are visible')
  end
end

-- Behave like vim
vim.api.nvim_set_keymap("n", "Y", "y$", {noremap = true});

-- Keep Line centered
vim.api.nvim_set_keymap("n", "n", "nzzzv", {noremap = true});
vim.api.nvim_set_keymap("n", "N", "Nzzzv", {noremap = true});
vim.api.nvim_set_keymap("n", "J", "mzJ`z", {noremap = true});

-- Move text
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", {noremap = true});
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", {noremap = true});
-- vim.api.nvim_set_keymap("i", "<C-j>", "<esc>:m .+1<CR>==", {noremap = true});
-- vim.api.nvim_set_keymap("i", "<C-k>", "<esc>:m .-2<CR>==", {noremap = true});
-- vim.api.nvim_set_keymap("n", "<leader>j", ":m .+1<CR>==", {noremap = true});
-- vim.api.nvim_set_keymap("n", "<leader>k", ":m .-2<CR>==", {noremap = true});

-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`

--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:

hooks.add("setup_mappings", function(map)
   map("n", "<leader>q", ":silent! :NvimTreeClose <CR>:q <CR>", opt);
   map("n", "<leader>qq", ":silent! :NvimTreeClose <CR>: q! <CR>", opt);
   map("n", "<leader>wq", ":silent! :NvimTreeClose <CR>:wq <CR>", opt);
   map("n", "<leader>lp", ":LspStop <CR>", opt);
   map("n", "<leader>ls", ":LspStart <CR>", opt);
   map("n", "<leader>7", ":CommentToggle <CR>", opt);
   map("v", "<leader>7", ":CommentToggle <CR>", opt);
   map("n", "<leader>m", ":Telescope marks <CR>", opt);
   map("n", "<leader>u", ":PackerUpdate <CR>", opt);
end)

-- Toggle LSP Diagnostics
vim.api.nvim_buf_set_keymap(0, 'n', '<Space>tt', ':call v:lua.toggle_diagnostics()<CR>', {silent=true, noremap=true})

-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:

hooks.add("install_plugins", function(use)
   use {
       "williamboman/nvim-lsp-installer",
       config = function()
          local lsp_installer = require "nvim-lsp-installer"

          lsp_installer.on_server_ready(function(server)
             local opts = {}

             server:setup(opts)
             vim.cmd [[ do User LspAttachBuffers ]]
          end)
       end,
    }
end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"
