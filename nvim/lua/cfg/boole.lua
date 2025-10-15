require("boole").setup({
	mappings = {
		increment = "<C-i>",
		decrement = "<C-d>",
	},
	allow_caps_additions = {
		-- Boolean state toggles
		{ "add",     "remove"     },
		{ "enable",  "disable"    },
		{ "enabled", "disabled"   },
		{ "on",      "off"        },
		{ "true",    "false"      },
		{ "yes",     "no"         },
		-- Network
		{ "accept",  "reject"     },
		{ "allow",   "deny"       },
		{ "connect", "disconnect" },
		{ "open",    "close"      },
		{ "send",    "recieve"    },
		{ "start",   "stop"       },
		-- Programming: control flow
		{ "break",    "continue"  },
		{ "const",    "let", "var"},
		{ "if",       "else"      },
		{ "in",       "out"       },
		{ "public",   "private"   },
		{ "try",      "catch"     },
		-- Directions/Programming: Haskell
		{ "left",     "right"     },
		-- Programming: C++
		{ "new",      "del"       },
		-- Programming: (N)asm
		{ "add",      "sub"       },
		{ "call",     "ret"       },
		{ "inc",      "dec"       },
		{ "ja",       "jbe"       },
		{ "je",       "jne"       },
		{ "push",    "pop", "pull"},
		{ "set",      "clear"     },
		-- Days
		{ "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun" },
		{ "Monday", "Tueday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" },
	},
})
