-- ██╗      ██████╗  ██████╗ ██╗  ██╗███████╗
-- ██║     ██╔═══██╗██╔═══██╗██║ ██╔╝██╔════╝
-- ██║     ██║   ██║██║   ██║█████╔╝ ███████╗
-- ██║     ██║   ██║██║   ██║██╔═██╗ ╚════██║
-- ███████╗╚██████╔╝╚██████╔╝██║  ██╗███████║
-- ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝

local palette = require("~/.config/hypr/opts/palette")

hl.config({
  general = {
    gaps_in  = 8,
    gaps_out = 15,

    border_size = 0,

    col = {
      active_border   = palette.border_ac,
      inactive_border = palette.border_ic,
    },

    resize_on_border = true,
    allow_tearing = false,
    layout = "dwindle",
  },

  decoration = {
    rounding       = 0,
    rounding_power = 0,

    active_opacity   = 1.0,
    inactive_opacity = 1.0,

    shadow = {
      enabled      = true,
      range        = 4,
      render_power = 3,
      color        = 0xee1a1a1a,
    },

    blur = {
      enabled   = true,
      size      = 3,
      passes    = 1,
      vibrancy  = 0.1696,
    },
  },

  animations = {
    enabled = false,
  },
})

