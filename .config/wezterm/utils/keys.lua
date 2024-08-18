local wt_action = require("wezterm").action
local wezterm = require("wezterm")
local M = {}

M.multiple_actions = function(keys)
    local actions = {}
    for key in keys:gmatch(".") do
        table.insert(actions, wt_action.SendKey({ key = key }))
    end
    table.insert(actions, wt_action.SendKey({ key = "\n" }))
    return wt_action.Multiple(actions)
end

M.key_table = function(mods, key, action)
    return {
        mods = mods,
        key = key,
        action = action,
    }
end

M.cmd_key = function(key, action)
    return M.key_table("CMD", key, action)
end

M.cmd_to_tmux_prefix = function(key, tmux_key)
    return M.cmd_key(
        key,
        wt_action.Multiple({
            wt_action.SendKey({ mods = "CTRL", key = "b" }),
            wt_action.SendKey({ key = tmux_key }),
        })
    )
end

M.tmux_keys = function(leader)
    return {
        { key = leader, mods = "LEADER|CTRL", action = wezterm.action.SendKey({ key = leader, mods = "CTRL" }) },

        { key = "%", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
        { key = '"', mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
        { key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },

        { key = "z", mods = "LEADER", action = "TogglePaneZoomState" },

        { key = "h", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
        { key = "j", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
        { key = "k", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
        { key = "l", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Right" }) },

        { key = "H", mods = "CTRL|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
        { key = "J", mods = "CTRL|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
        { key = "K", mods = "CTRL|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
        { key = "L", mods = "CTRL|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },

        { key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
        { key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
        { key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
        { key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
        { key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
        { key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
        { key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
        { key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
        { key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },

        { key = "&", mods = "LEADER|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
        { key = "d", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
        { key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },

        -- this is otherpeople's tmux-style keybindings
        -- rotate panes
        { key = "Space", mods = "LEADER", action = wezterm.action.RotatePanes("Clockwise") },
        -- show the pane selection mode, but have it swap the active and selected panes
        { key = "0", mods = "LEADER", action = wezterm.action.PaneSelect({ mode = "SwapWithActive" }) },
    }
end

return M
