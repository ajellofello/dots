-- ██████╗ ██╗███╗   ██╗██████╗ ███████╗
-- ██╔══██╗██║████╗  ██║██╔══██╗██╔════╝
-- ██████╔╝██║██╔██╗ ██║██║  ██║███████╗
-- ██╔══██╗██║██║╚██╗██║██║  ██║╚════██║
-- ██████╔╝██║██║ ╚████║██████╔╝███████║
-- ╚═════╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝

local terminal    = "kitty"
local launcher    = "rofi -show drun -display-drun 'RUN '"
local colorpicker = "hyprpicker -a -u 60"
local lockscreen  = "hyprlock"
local screenshot  = "slurp | grim -g - - | tee ~/Pictures/Screenshots/$(date +%s).png > /dev/null"
local statusbar   = "waybar -s ~/.config/waybar/styles/vague.css"

local mainMod = "SUPER"

-- TOGGLES 
hl.bind(mainMod .. " + RETURN",    hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.exec_cmd(colorpicker))
hl.bind(mainMod .. " + M",         hl.dsp.exec_cmd(lockscreen))
hl.bind("PRINT",                   hl.dsp.exec_cmd(screenshot))
hl.bind(mainMod .. " + O",         hl.dsp.exec_cmd(launcher))

-- Log out
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("poweroff"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("reboot"))

-- Reload waybar
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("killall waybar && " .. statusbar))

-- WINDOWS
hl.bind(mainMod .. " + C",     hl.dsp.window.close()) -- close a window
hl.bind(mainMod .. " + SPACE", hl.dsp.window.float({ action = "toggle" })) -- toggle floating mode

-- Move around windows
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move windows around
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- WORKSPACES
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- mouse interactions
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- LAPTOP FUNCTION KEY FUNCTIONALITY

-- change brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- change audio
hl.bind("XF86AudioNext",        hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause",       hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",        hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",        hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

