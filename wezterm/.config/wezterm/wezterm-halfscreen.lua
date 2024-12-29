-- Launch WezTerm with a half-screen window size and a visible titlebar.

local config = require("config")

config.window_decorations = "TITLE|RESIZE"
config.use_fancy_tab_bar = true

require("padding").setup()
require("keybindings").setup(config)

return config
