local M = {}

local colors = require('yume.palette')

M.setup = function()
  return {
    Comment = { fg = colors.subtext, italic = true },
    SpecialComment = { link = 'Special' },
    Constant = { fg = colors.neon_orchid },
    String = { fg = colors.carnation_pink },
    Character = { link = 'String' },
    Number = { fg = colors.neon_orchid },
    Float = { fg = colors.neon_orchid },
    Boolean = { fg = colors.neon_orchid },
    Identifier = { fg = colors.neon_orchid },
    Function = { fg = colors.bright_orchid },
    Label = { fg = colors.pastel_indigo },
    Operator = { fg = colors.bright_orchid },
    Keyword = { fg = colors.bright_orchid },
    Exception = { fg = colors.coral_pink },
    Conditional = { link = 'Keyword' },
    Statement = { link = 'Keyword' },
    Repeat = { link = 'Keyword' },

    StorageClass = { fg = colors.bright_orchid },
    Structure = { fg = colors.bright_orchid },
    Special = { fg = colors.male_pauve_mist },
    Type = { fg = colors.bright_orchid },
    Typedef = { link = 'Type' },
    SpecialChar = { link = 'Special' },
    Tag = { fg = colors.male_pauve_mist },
    Debug = { fg = colors.soft_orchid_pink },
  }
end

return M
