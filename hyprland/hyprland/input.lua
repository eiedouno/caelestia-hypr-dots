local vars = require("variables")

hl.config({
	input = {
		kb_layout = "us",
		-- kb_options = "caps:escape_shifted_capslock"
		kb_options = "caps:escape",
		numlock_by_default = true,
		repeat_delay = 200,
		repeat_rate = 40,
		sensitivity = -0.7,
		focus_on_close = 1,

		touchpad = {
			natural_scroll = true,
			disable_while_typing = vars.touchpadDisableTyping,
			scroll_factor = vars.touchpadScrollFactor,
		},
	},

	binds = {
		scroll_event_delay = 0,
	},

	cursor = {
		hotspot_padding = 1,
	},
})
