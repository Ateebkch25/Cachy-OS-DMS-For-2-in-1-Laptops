-- Touchscreen Gestures configuration via hyprgrass (Hyprland Lua)
-- Plugin: https://github.com/horriblename/hyprgrass

-- ============================================================================
-- GESTURE SENSITIVITY & CONFIGURATION
-- ============================================================================
-- sensitivity:
--   Default is 1.0. For high-resolution touchscreens / tablets, 2.0 to 4.0
--   is recommended (higher value = less movement required to trigger gesture).
hl.config({
	plugin = {
		hyprgrass = {
			-- Note: hyprgrass sensitivity controls window manager gesture threshold (threshold = 30 / sensitivity).
			-- In-app touch scrolling (YouTube, Chrome, etc.) is handled directly by applications via Wayland touch events.
			sensitivity = 3.0,
			long_press_delay = 400, -- milliseconds
			edge_margin = 10, -- pixels from edge for edge swipes
			resize_on_border_long_press = true,
		},
	},
})

-- ============================================================================
-- TOUCHSCREEN GESTURE BINDINGS
-- ============================================================================
local function register_touch_gestures()
	if not (hl.plugin and hl.plugin.hyprgrass) then
		return false
	end

	local hg = hl.plugin.hyprgrass


	-- 1. 3 finger horizontal: Freely scroll ribbon tape in real-time (continuous 1:1 glide)
	hg.gesture({
		pattern = { kind = "swipe", fingers = 3, direction = "horizontal" },
		action = "scroll_move",
		scale = 5.0,
	})

	-- 3. 3 finger up: Close active app / window
	hg.bind({
		pattern = { kind = "swipe", fingers = 3, direction = "up" },
		action = hl.dsp.window.close(),
	})

	-- 4. 3 finger down: Full screen window toggle
	hg.bind({
		pattern = { kind = "swipe", fingers = 3, direction = "down" },
		action = hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }),
	})

	-- 5. 4 finger down: App launcher (DMS Spotlight)
	hg.bind({
		pattern = { kind = "swipe", fingers = 4, direction = "down" },
		action = hl.dsp.exec_cmd("dms ipc call spotlight toggle"),
	})

	-- 6. 4 finger left: Change workspace right (next)
	hg.bind({
		pattern = { kind = "swipe", fingers = 4, direction = "left" },
		action = hl.dsp.focus({ workspace = "e+1" }),
	})

	-- 7. 4 finger right: Change workspace left (previous)
	hg.bind({
		pattern = { kind = "swipe", fingers = 4, direction = "right" },
		action = hl.dsp.focus({ workspace = "e-1" }),
	})

	return true
end

-- Attempt immediate registration if plugin is loaded
if not register_touch_gestures() then
	-- Fallback hook if plugin is loaded later during hyprland.start
	hl.on("hyprland.start", function()
		register_touch_gestures()
	end)
end
