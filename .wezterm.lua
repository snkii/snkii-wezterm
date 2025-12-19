local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- =========================
-- Leader key (tmux prefix)
-- =========================
config.leader = {
  key = "b",
  mods = "CTRL",
  timeout_milliseconds = 2000,
}

-- =========================
-- Key bindings
-- =========================
config.keys = {
  -- Text editing passthrough
  { key = "Backspace", mods = "CTRL", action = act.SendKey { key = "w", mods = "CTRL" } },
  { key = "Delete",    mods = "CTRL", action = act.SendKey { key = "d", mods = "ALT" } },

  -- Pane split
  { key = "'", mods = "LEADER", action = act.SplitVertical {
      domain = "CurrentPaneDomain"
    }
  },
  { key = ";", mods = "LEADER", action = act.SplitHorizontal {
      domain = "CurrentPaneDomain"
    }
  },

  -- Pane navigation (vim/tmux style)
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection "Left" },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection "Down" },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection "Up" },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection "Right" },

  -- Close pane
  { key = "w", mods = "LEADER", action = act.CloseCurrentPane { confirm = true } },

  -- Tabs (tmux window analog)
  { key = "c", mods = "LEADER", action = act.SpawnTab "CurrentPaneDomain" },
  { key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
  { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
}

-- =========================
-- Appearance / behavior
-- =========================
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 12.0
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.color_scheme = "Gruvbox Dark (Gogh)"

config.default_gui_startup_args = { "connect", "SSHMUX:hi20" }
config.enable_wayland = true
config.xcursor_theme = "default"

return config
