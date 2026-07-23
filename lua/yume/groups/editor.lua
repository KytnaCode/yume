local M = {}

local colors = require('yume.palette')

M.setup = function()
  return {
    Cursor = { fg = colors.alabaster_pink, bg = colors.carnation_pink },
    CursorLine = { bg = colors.white_rose_dust },
    StatusLine = { bg = colors.alabaster_pink },
    StatusLineNC = { link = 'StatusLine' },
    WinSeparator = { fg = colors.white_rose_dust },
    Normal = { fg = colors.text, bg = colors.alabaster_pink },
    NormalNC = { fg = colors.text, bg = colors.white_rose_dust },
    Visual = { fg = colors.text, bg = colors.pastel_lavender },
    VisualNOS = { fg = colors.text, bg = colors.pale_thistle },
    Pmenu = { fg = colors.text, bg = colors.alabaster_pink },
    PmenuSel = { fg = colors.text, bg = colors.white_rose_dust },
  }
end

return M
