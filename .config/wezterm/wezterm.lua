local wezterm = require('wezterm')

return {
    font = wezterm.font("MonoLisa Nerd Font"),
    font_size = 16,

    color_scheme = "Catppuccin Mocha",

    -- tab bar settings
    use_fancy_tab_bar = false,
    tab_bar_at_bottom = true,
    hide_tab_bar_if_only_one_tab = true,
}
