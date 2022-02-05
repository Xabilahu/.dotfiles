local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

M.options = {
  expandtab = true,
  shiftwidth = 4,
  smartindent = true,
  ignorecase = false,
  mouse = "",
  number = true,
  relativenumber = true,
  tabstop = 4,
  mapleader = " ",
}

M.ui = {
   theme = "chadracula"
}

-- NvChad included plugin options & overrides
M.plugins = {
   status = {
      dashboard = true,
      telescope_media = true,
   },
   options = {
      nvimtree = {
         auto_close = true,
         lsp_diagnostics = false,
      },
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },

   default_plugin_config_replace = {
     dashboard = "custom.plugins.dashboard",
     feline = "custom.plugins.statusline",
   },

   install = {
    {
      "williamboman/nvim-lsp-installer",
      config = function()
         local lsp_installer = require "nvim-lsp-installer"

         lsp_installer.on_server_ready(function(server)
            local opts = {}

            server:setup(opts)
            vim.cmd [[ do User LspAttachBuffers ]]
         end)
      end,
    },
    {'sbdchd/neoformat',},
    {
      'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
      config = function()
          require'toggle_lsp_diagnostics'.init({ underline = false })
      end,
    }
  },
}

return M
