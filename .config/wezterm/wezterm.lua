--
-- ██╗    ██╗███████╗███████╗████████╗███████╗██████╗ ███╗   ███╗
-- ██║    ██║██╔════╝╚══███╔╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║
-- ██║ █╗ ██║█████╗    ███╔╝    ██║   █████╗  ██████╔╝██╔████╔██║
-- ██║███╗██║██╔══╝   ███╔╝     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║
-- ╚███╔███╔╝███████╗███████╗   ██║   ███████╗██║  ██║██║ ╚═╝ ██║
--  ╚══╝╚══╝ ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝
-- A GPU-accelerated cross-platform terminal emulator
-- https://wezfurlong.org/wezterm/

local wallpapers_glob = os.getenv("HOME") .. "/Pictures/wallpapers/**"
_ = wallpapers_glob

local k = require("utils/keys")
local w = require("utils.wallpaper")
local cs = require("utils.color_scheme")
-- "Catppuccin Mocha"
-- "kanagawa (Gogh)"
local color_scheme = "kanagawa (Gogh)"
local leader = "a"

local wezterm = require("wezterm")

local config = {

    background = {
        -- w.set_wallpaper("a_large_red_barrels_with_numbers_and_pipes.jpg"),
        w.get_wallpaper(wallpapers_glob),

        {
            source = {
                Color = cs.get_base(color_scheme),
            },
            height = "100%",
            width = "100%",
            opacity = 0.9,
        },
    },

    -- to fit with the screen
    font_size = 156/10,

    line_height = 1.1,
    font = wezterm.font_with_fallback({
        "CommitMono",
        "Server Mono",
        "MesloLGS Nerd Font Mono",
    }),

    force_reverse_video_cursor = true,
    -- "Catppuccin Mocha"
    color_scheme = color_scheme,
    colors = cs.get_colors(),

    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    window_frame = {
        border_left_width = "0.25cell",
    --     border_right_width = "0.5cell",
    --     border_bottom_height = "0.25cell",
    --     border_top_height = "0.25cell",
    --     border_left_color = "#2b2042",
    --     border_right_color = "#2b2042",
    --     border_bottom_color = "#2b2042",
    --     border_top_color = "#2b2042",
    --     active_titlebar_bg = "#090909",
    },
    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.65,
    },

    -- general options
    adjust_window_size_when_changing_font_size = false,
    debug_key_events = true,
    hide_tab_bar_if_only_one_tab = true,
    use_fancy_tab_bar = false,

    native_macos_fullscreen_mode = false,
    window_close_confirmation = "NeverPrompt",
    window_decorations = "RESIZE",
    quit_when_all_windows_are_closed = false,
    pane_focus_follows_mouse = true,

    -- keys
    leader = { key = leader, mods = "CTRL", timeout_milliseconds = 1000 },

    keys = k.tmux_keys(leader),
}

config.keys = {
    {
        key = "r",
        mods = "CMD|SHIFT",
        action = wezterm.action.ReloadConfiguration,
    },

    { key = leader, mods = "LEADER|CTRL", action = wezterm.action.SendKey({ key = leader, mods = "CTRL" }) },
}

return config
