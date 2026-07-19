local M = {}

M.setup = function()
  local editor = require('yume.groups.editor').setup()
  local syntax = require('yume.groups.syntax').setup()
  local treesitter = require('yume.groups.treesitter').setup()

  return vim.tbl_extend('error', syntax, treesitter, editor)
end

return M
