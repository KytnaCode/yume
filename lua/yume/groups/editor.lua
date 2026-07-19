local M = {}

local colors = require('yume.palette')

M.setup = function()
  return {
    Cursor = { fg = colors.alabaster_pink, bg = colors.carnation_pink },
    Normal = { fg = colors.text, bg = colors.alabaster_pink },
    Visual = { fg = colors.text, bg = colors.pastel_lavender },
    VisualNOS = { fg = colors.text, bg = colors.pale_thistle },
  }
end

return M
