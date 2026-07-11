local M = {}

local colors = require('yume.palette')

M.setup = function()
  return {
    Comment = { fg = colors.cloud_pillow, italic = true },
    SpecialComment = { link = 'Special' },
    Constant = { fg = colors.bright_pink },
    String = { fg = colors.green },
    Character = { fg = colors.bright_green },
    Number = { fg = colors.bright_pink },
    Float = { fg = colors.bright_pink },
    Boolean = { fg = colors.bright_pink },
    Identifier = { fg = colors.bright_pink },
    Function = { fg = colors.blue },
    Label = { fg = colors.bright_blue },
    Operator = { fg = colors.magic_purple },
    Keyword = { fg = colors.deep_violet },
    Exception = { fg = colors.cozy_red },

    StorageClass = { fg = colors.magic_purple },
    Structure = { fg = colors.magic_purple },
    Special = { fg = colors.marshmellow },
    Type = { fg = colors.deep_violet },
    Typedef = { link = 'Type' },
    SpecialChar = { link = 'Special' },
    Tag = { fg = colors.base_300 },
    Debug = { fg = colors.base_400 },
  }
end

return M
