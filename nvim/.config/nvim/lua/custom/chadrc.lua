-- IMPORTANT NOTE : This is the user config, can be edited. Will be preserved if updated with internal updater
-- This file is for NvChad options & tools, custom settings are split between here and 'lua/custom/init.lua'

local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

-- NOTE: To use this, make a copy with `cp example_chadrc.lua chadrc.lua`

--------------------------------------------------------------------

-- To use this file, copy the strucutre of `core/default_config.lua`,
-- examples of setting relative number & changing theme:

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
   },
   -- To change the Packer `config` of a plugin that comes with NvChad,
   -- add a table entry below matching the plugin github name
   --              '-' -> '_', remove any '.lua', '.nvim' extensions
   -- this string will be called in a `require`
   --              use "(custom.configs).my_func()" to call a function
   --              use "custom.blankline" to call a file
   default_plugin_config_replace = {
     dashboard = "custom.configs.dashboard",
     feline = "custom.configs.statusline",
   },
}

return M
