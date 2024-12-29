local wezterm = require("wezterm")

-- Init config

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Fonts

config.font = wezterm.font_with_fallback({
    {
        family = "FiraCode-Retina",
        harfbuzz_features = { 'calt=0', "clig=0", "liga=0", "zero", "cv05", "ss03", "ss05" },
    },
    {
        family = "Noto Color Emoji",
    },
    {
        family = "Symbols Nerd Font Mono",
    },
    {
        -- https://github.com/edihbrandon/RictyDiminished
        family = "Ricty Diminished",
        scale = 1.2,
    },
    {
        -- https://github.com/adobe-fonts/source-han-code-jp
        family = "Source Han Code JP",
    }
})
config.font_size = 12 -- 12.7

-- CJK settings

config.use_ime = true
config.use_cap_height_to_scale_fallback_fonts = true

-- Window Style

config.window_background_opacity = 0.8
config.window_decorations = "RESIZE"
config.initial_cols = 120
config.initial_rows = 40

-- Features

config.enable_tab_bar = false
config.enable_scroll_bar = false
config.adjust_window_size_when_changing_font_size = false

-- Colors

config.color_scheme = 'Catppuccin Macchiato'
config.colors = {
    -- background = "black",
    -- cursor_bg = "white",
    -- cursor_border = "white",
}

-- Cursor animation

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'
config.hide_mouse_cursor_when_typing = true

-- Performance

local gpus = wezterm.gui.enumerate_gpus()
config.webgpu_preferred_adapter = gpus[1]

config.animation_fps = 120
config.max_fps = 120

return config
