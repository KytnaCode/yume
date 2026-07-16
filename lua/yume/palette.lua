local colors = {
  -- Pinks
  hot_magenta = '#E92E98',
  neon_orchid = '#F351AD',
  carnation_pink = '#F978C1',
  bubblegum_pink = '#FCA7D7',
  cotton_candy = '#FFE2F2',

  -- Purples
  vivid_amethyst = '#AD31D9',
  bright_orchid = '#C355EA',
  psychedetic_purple = '#D47BF4',
  pastel_lavender = '#E5A9FA',
  pale_thistle = '#F7E3FE',

  -- Reds
  electric_crimson = '#FA3149',
  watermelon_red = '#FC5569',
  coral_pink = '#FC5569',
  soft_salmon = '#FEA8B2',
  blush_whisper = '#FFE3E6',

  -- Greens
  hint_of_mint = '#82EA7D',
  celadon_mist = '#9BEE97',
  pale_pistachio = '#B4F2B1',
  soft_mint = '#CDF7CB',
  light_matcha = '#E6FBE5',

  -- Yellows
  cream_chiffon = '#FFF788',
  pale_buttercream = '#FFF9A0',
  chiffon_yellow = '#FFFAB8',
  soft_primrose = '#FFFCCF',
  pastel_canary = '#FFFDE7',

  -- Blues
  bright_periwinkle = '#9B86F8',
  soft_lavender_blue = '#AF9EF9',
  pastel_indigo = '#C3B6FB',
  sweet_iris = '#D7CFFC',
  glacial_blue = '#EBE7FE',

  -- Magenta
  -- psychedelic_purple
  light_orchid = '#DD95F6',
  bright_lilac = '#E5B0F8',
  pale_heather = '#EECAFB',
  white_orchid = '#F6E5FD',

  -- Cyan
  bright_turquoise = '#66E7E7',
  electric_aquamarine = '#85ECEC',
  pale_cyan = '#A3F1F1',
  ice_blue = '#C2F5F5',
  water_vapor = '#E0FAFA',

  -- Bases
  alabaster_pink = '#FAEFF5',
  white_rose_dust = '#F5DFEA',
  male_pauve_mist = '#F0CFE0',
  soft_orchid_pink = '#EBBFD5',
  pastel_rose_quartz = '#E6AFCB',
  antique_rose = '#B88CA2',
  dusty_rose_wood = '#8A697A',
  muted_eggplant = '#5C4651',
  dark_plum_charcoal = '#2E2329',
}

return vim.tbl_extend('force', colors, {
  -- Foreground
  text = colors.dark_plum_charcoal,
  subtext = colors.dusty_rose_wood,

  -- Semantic colors
  error = colors.coral_pink,
  warning = colors.pale_buttercream,
  success = colors.pale_pistachio,
  info = colors.pastel_rose_quartz,
  debug = colors.bright_lilac,

  -- ASCII Colors
  black = colors.dark_plum_charcoal,
  bright_black = colors.dusty_rose_wood,
  red = colors.watermelon_red,
  bright_red = colors.soft_salmon,
  green = colors.celadon_mist,
  bright_green = colors.soft_mint,
  yellow = colors.pale_buttercream,
  bright_yellow = colors.soft_primrose,
  blue = colors.bright_periwinkle,
  bright_blue = colors.sweet_iris,
  magenta = colors.light_orchid,
  bright_magenta = colors.pale_heather,
  cyan = colors.electric_aquamarine,
  bright_cyan = colors.ice_blue,
  white = colors.white_rose_dust,
  bright_white = colors.alabaster_pink,
})
