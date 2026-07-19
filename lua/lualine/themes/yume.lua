local colors = require('yume.palette')

return {
  normal = {
    a = { bg = colors.carnation_pink, fg = colors.alabaster_pink },
    b = { bg = colors.white_rose_dust, fg = colors.text },
    c = { bg = colors.alabaster_pink, fg = colors.text },
  },
  insert = {
    a = { bg = colors.cream_chiffon, fg = colors.text },
    b = { bg = colors.chiffon_yellow, fg = colors.text },
    c = { bg = colors.alabaster_pink, fg = colors.text },
  },
  visual = {
    a = { bg = colors.psychedelic_purple, fg = colors.alabaster_pink },
    b = { bg = colors.pale_heather, fg = colors.text },
    c = { bg = colors.alabaster_pink, fg = colors.text },
  },
  replace = {
    a = { bg = colors.bright_turquoise, fg = colors.text },
    b = { bg = colors.ice_blue, fg = colors.text },
    c = { bg = colors.alabaster_pink, fg = colors.text },
  },
  command = {
    a = { bg = colors.hint_of_mint, fg = colors.text },
    b = { bg = colors.pale_pistachio, fg = colors.text },
    c = { bg = colors.alabaster_pink, fg = colors.text },
  },
  inactive = {
    a = { bg = colors.muted_eggplant, fg = colors.alabaster_pink },
    b = { bg = colors.pave_mauve_mist, fg = colors.text },
    c = { bg = colors.alabaster_pink, fg = colors.text },
  },
}
