local M = {}

M.opts = {
  integrations = {
    neotree = false,
  },
}

M.setup = function(opts)
  M.opts = vim.tbl_extend('keep', opts or {}, M.opts)
end

M.load = function()
  local groups = require('yume.groups').setup(M.opts)

  for group, setting in pairs(groups) do
    vim.api.nvim_set_hl(0, group, setting)
  end
end

return M
