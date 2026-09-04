-- DMS user keybind overrides (edit via Control Center or dms; do not remove this header)

hl.unbind("SUPER + E")
hl.bind("SUPER + E", hl.dsp.exec_cmd("nautilus"))

-- Grow / shrink column width by 5% on the ribbon
hl.bind("SUPER + equal", hl.dsp.layout("colresize +0.05"), { repeating = true, description = "Grow column width" })
hl.bind("SUPER + minus", hl.dsp.layout("colresize -0.05"), { repeating = true, description = "Shrink column width" })

-- Touchpad: 3-finger horizontal smoothly scrolls the ribbon tape (scaled for higher sensitivity)
hl.gesture({ fingers = 3, direction = "horizontal", action = "unset" })
hl.gesture({ fingers = 3, direction = "horizontal", action = "scroll_move", scale = 2.5 })

-- Touchpad: 3-finger up closes active window
hl.gesture({ fingers = 3, direction = "up", action = "close" })

-- Touchpad: 3-finger down toggles fullscreen
hl.gesture({ fingers = 3, direction = "down", action = "fullscreen" })

-- Touchpad: 4-finger horizontal switches workspaces
hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })

