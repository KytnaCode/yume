local M = {}

local colors = require('yume.palette')

M.setup = function()
  return {
    ['@variable'] = { fg = colors.text },
    ['@variable.builtin'] = { fg = colors.bright_orchid },
    ['@variable.parameter'] = { fg = colors.neon_orchid },
    ['@string'] = { fg = colors.carnation_pink },
    ['@function.builtin'] = { link = '@function' },
    ['@function'] = { link = 'Keyword' },
  }
end

return M
