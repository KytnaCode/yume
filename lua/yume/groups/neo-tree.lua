local M = {}

local colors = require('yume.palette')

M.setup = function()
  return {
    Directory = { fg = colors.carnation_pink },
    NeoTreeFileName = { fg = colors.text },
    NeoTreeDirectoryName = { fg = colors.text },
    NeoTreeModified = { fg = colors.carnation_pink },
    NeoTreeGitAdded = { fg = colors.hint_of_mint },
    NeoTreeGitModified = { fg = colors.bright_periwinkle },
    NeoTreeGitDeleted = { fg = colors.coral_pink },
  }
end

return M
