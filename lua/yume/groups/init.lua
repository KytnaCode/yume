local M = {}

M.setup = function(opts)
  local editor = require('yume.groups.editor').setup()
  local syntax = require('yume.groups.syntax').setup()
  local treesitter = require('yume.groups.treesitter').setup()

  local hi = vim.tbl_extend('error', syntax, treesitter, editor)

  if opts.integrations.neotree == true then
    hi = vim.tbl_extend('error', hi, require('yume.groups.neo-tree').setup())
  end

  return hi
end

return M
