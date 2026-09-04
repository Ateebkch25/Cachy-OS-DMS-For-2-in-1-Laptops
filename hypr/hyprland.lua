-- Hyprland configuration (Lua) — https://wiki.hypr.land/Configuring/Start/

-- DMS_STARTUP_BEGIN
hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("systemctl --user start hyprland-session.target")
	hl.exec_cmd("hyprctl plugin load " .. os.getenv("HOME") .. "/.config/hypr/plugins/hyprgrass.so")
end)
-- DMS_STARTUP_END

-- Load hyprgrass plugin synchronously so hl.plugin.hyprgrass is available immediately
local hyprgrass_path = os.getenv("HOME") .. "/.config/hypr/plugins/hyprgrass.so"
if hl.plugin and hl.plugin.load then
	pcall(hl.plugin.load, hyprgrass_path)
end

hl.config({
	input = {
		-- empty inherits XKB_DEFAULT_LAYOUT (libxkbcommon), falls back to "us"
		kb_layout = "us",
		numlock_by_default = true,
		follow_mouse = 1,
		sensitivity = 0.5,
		touchpad = {
			tap_to_click = true,
			natural_scroll = true,
			scroll_factor = 1.5
		},
	},
	general = {
		gaps_in = 5,
		gaps_out = 5,
		border_size = 2,
		layout = "scrolling",
	},
	scrolling = {
		-- 0 = Center focused column (Niri-style centering where other windows flow off left & right)
		-- 1 = Fit mode (anchors to edges)
		focus_fit_method = 1,
		-- Disable automatic scrolling when cursor moves over windows; ribbon only scrolls with your gestures
		follow_focus = false,
		-- 0.0 allows windows to stop freely at any point on the tape without forced snapping
		follow_min_visible = 0.0,
		-- Don't force a single column to expand to 100% fullscreen (maintains true column widths like Niri)
		fullscreen_on_one_column = true,
		-- Default width fraction (0.5 = 50% of screen)
		column_width = 0.5,
		-- Width presets to cycle through
		explicit_column_widths = "0.333, 0.5, 0.667, 1.0",
	},
	gestures = {
		scrolling = {
			move_snap_to_grid = false,
			move_snap_cursor = false,
		},
	},
	decoration = {
		rounding = 12,
		active_opacity = 1.0,
		inactive_opacity = 0.9,
		shadow = {
			enabled = true,
			range = 30,
			render_power = 5,
			offset = "0 5",
			color = "rgba(00000070)",
		},
	},
	misc = {
		disable_hyprland_logo = false,
		disable_splash_rendering = false,
	},
	dwindle = {
		preserve_split = true,
	},
	master = {
		mfact = 0.5,
	},
})

hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 3, bezier = "default" })

hl.window_rule({ match = { class = "^(org\\.wezfurlong\\.wezterm)$" }, tile = true })
hl.window_rule({ match = { class = "^(org\\.gnome\\.)" }, rounding = 12 })
hl.window_rule({ match = { class = "^(gnome-control-center)$" }, tile = true })
hl.window_rule({ match = { class = "^(pavucontrol)$" }, tile = true })
hl.window_rule({ match = { class = "^(nm-connection-editor)$" }, tile = true })
hl.window_rule({ match = { class = "^(org\\.gnome\\.Calculator)$" }, float = true })
hl.window_rule({ match = { class = "^(gnome-calculator)$" }, float = true })
hl.window_rule({ match = { class = "^(galculator)$" }, float = true })
hl.window_rule({ match = { class = "^(blueman-manager)$" }, float = true })
hl.window_rule({ match = { class = "^(org\\.gnome\\.Nautilus)$" }, float = true })
hl.window_rule({ match = { class = "^(xdg-desktop-portal)$" }, float = true })
hl.window_rule({
	match = { class = "^(steam)$", title = "^(notificationtoasts)" },
	no_initial_focus = true,
	pin = true,
})
hl.window_rule({
	match = { class = "^(firefox)$", title = "^(Picture-in-Picture)$" },
	float = true,
})
hl.window_rule({ match = { class = "^(zoom)$" }, float = true })
hl.layer_rule({ match = { namespace = "^(quickshell)$" }, no_anim = true })
hl.layer_rule({ match = { namespace = "^dms:.*" }, no_anim = true })

require("dms.colors")
require("dms.outputs")
require("dms.layout")
require("dms.cursor")
require("dms.binds")
require("dms.binds-user")
require("dms.windowrules")
package.loaded["touch"] = nil
require("touch")
