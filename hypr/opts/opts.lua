--  ██████╗ ██████╗ ████████╗███████╗
-- ██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝
-- ██║   ██║██████╔╝   ██║   ███████╗
-- ██║   ██║██╔═══╝    ██║   ╚════██║
-- ╚██████╔╝██║        ██║   ███████║
--  ╚═════╝ ╚═╝        ╚═╝   ╚══════╝

local palette = require("~/.config/hypr/opts/palette")

-- Monitor Options
hl.monitor({
  output   = "",
  mode     = "1920x1080@60",
  position = "0x0",
  scale    = "1",
})

-- Autostart
hl.on("hyprland.start", function () 
  hl.exec_cmd("waybar & hyprpaper")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("systemctl --user start hyprpolitagent")
end)

-- Environment Variables
hl.env("XCURSOR_SIZE", "22")
hl.env("HYPRCURSOR_SIZE", "22")

-- Input & Misc
hl.config({
    misc = {
      force_default_wallpaper  = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
      disable_splash_rendering = 1,
      disable_hyprland_logo    = true, -- If true disables the random hyprland logo / anime girl background. :(
      background_color         = palette.bg
    },

    input = {
      kb_layout    = "us",
      kb_variant   = "",
      kb_model     = "",
      kb_options   = "caps:swapescape",
      kb_rules     = "",
      repeat_rate  = 30,
      repeat_delay = 300,

      follow_mouse = 1,

      sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification.

      touchpad = {
          natural_scroll = true,
      },
  },

})

-- Window Rules
hl.window_rule({
  name  = "fix-xwayland-drags",
  match = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },

  no_focus = true,
})

hl.window_rule({
  name  = "move-hyprland-run",
  match = { class = "hyprland-run" },

  move  = "20 monitor_h-120",
  float = true,
})

-- I don't know :(
hl.config({
  dwindle = {
    preserve_split = true, -- You probably want this
  },
})

hl.config({
  master = {
    new_status = "master",
  },
})

hl.config({
  scrolling = {
    fullscreen_on_one_column = true,
  },
})

local suppressMaximizeRule = hl.window_rule({
  -- Ignore maximize requests from all apps. You'll probably like this.
  name  = "suppress-maximize-events",
  match = { class = ".*" },

  suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

