local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Monokai Pro (Gogh)'
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.window_background_opacity = 0.8
config.macos_window_background_blur = 25

local act = wezterm.action
config.keys = {
  { key = "1", mods = "CMD|CTRL", action = act.DisableDefaultAssignment },
  { key = "2", mods = "CMD|CTRL", action = act.DisableDefaultAssignment },

  -- pane navigation
  {
    key = 'LeftArrow',
    mods = 'CTRL|SUPER',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'CTRL|SUPER',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'CTRL|SUPER',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'CTRL|SUPER',
    action = act.ActivatePaneDirection 'Down',
  },
  {
    key = 'w',
    mods = 'SUPER',
    action = act.CloseCurrentPane { confirm = false },
  },
  {
    key = 'd',
    mods = 'SUPER',
    action = wezterm.action.SplitPane { direction = 'Right', size = { Percent = 50 } },
  },
  {
    key = 'd',
    mods = 'SUPER|SHIFT',
    action = wezterm.action.SplitPane { direction = 'Down', size = { Percent = 50 } },
  },

  -- pane resizing
  {
    key = "LeftArrow",
    mods = "SUPER|CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize { "Left", 3 }
  },
  {
    key = "RightArrow",
    mods = "SUPER|CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize { "Right", 3 }
  },
  {
    key = "UpArrow",
    mods = "SUPER|CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize { "Up", 3 }
  },
  {
    key = "DownArrow",
    mods = "SUPER|CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize { "Down", 3 }
  },

  -- wezterm stuff
  {
    key = 'p',
    mods = 'SUPER|SHIFT',
    action = act.ActivateCommandPalette
  },
  {
    key = 't',
    mods = 'SUPER|SHIFT',
    action = act.ShowTabNavigator,
  },

  -- cursor navigation
  {
    key = "LeftArrow",
    mods = "ALT",
    action = wezterm.action.SendString("\x1bb"), -- backward one word
  },
  {
    key = "RightArrow",
    mods = "ALT",
    action = wezterm.action.SendString("\x1bf"), -- forward one word
  },
  {
    key = "LeftArrow",
    mods = "SUPER",
    action = wezterm.action.SendString("\x01"), -- beginning of line
  },
  {
    key = "RightArrow",
    mods = "SUPER",
    action = wezterm.action.SendString("\x05"), -- end of line
  },
  {
    key = "Backspace",
    mods = "SUPER",
    action = wezterm.action.SendString("\x15")
  }
}

return config
