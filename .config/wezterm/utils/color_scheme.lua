local wezterm = require("wezterm")
local M = {}

local kanagawa = {
    rosewater = "#f5e0dc",
    flamingo = "#f2cdcd",
    pink = "#f5c2e7",
    mauve = "#cba6f7",
    red = "#f38ba8",
    maroon = "#eba0ac",
    peach = "#fab387",
    yellow = "#f9e2af",
    green = "#a6e3a1",
    teal = "#94e2d5",
    sky = "#89dceb",
    sapphire = "#74c7ec",
    blue = "#89b4fa",
    lavender = "#b4befe",
    text = "#cdd6f4",
    subtext1 = "#bac2de",
    subtext0 = "#a6adc8",
    overlay2 = "#9399b2",
    overlay1 = "#7f849c",
    overlay0 = "#6c7086",
    surface2 = "#585b70",
    surface1 = "#45475a",
    surface0 = "#313244",
    base = "#1f1f28",
    mantle = "#181825",
    crust = "#11111b",
}

M.get_base = function(color_scheme)
    if color_scheme == "Catppuccin Mocha" then
        return "#1E1E2E" -- Catppuccin
    else
        return "#1f1f28" -- Kanagawa
    end
end

M.get_color_scheme = function()
    -- return get_color_scheme()
    -- return "kanagawa (Gogh)"
    return "Catppuccin Mocha"
end

M.get_colors = function()
    return {
        tab_bar = {
            background = "rgba(0, 0, 0, 0.4)",
            active_tab = {
                bg_color = kanagawa.surface2,
                fg_color = kanagawa.text,
            },
            inactive_tab = {
                bg_color = kanagawa.surface0,
                fg_color = kanagawa.subtext1,
            },
            inactive_tab_hover = {
                bg_color = kanagawa.surface0,
                fg_color = kanagawa.text,
            },
            new_tab = {
                bg_color = kanagawa.base,
                fg_color = kanagawa.text,
            },
            new_tab_hover = {
                bg_color = kanagawa.mantle,
                fg_color = kanagawa.text,
                italic = true,
            },
        },
    }
end

return M
