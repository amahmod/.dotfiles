local wezterm = require('wezterm')
local act = wezterm.action

return {
  -- Copy/Paste {{{
  { key = 'v', mods = 'ALT', action = 'ActivateCopyMode' },
  { key = 'C', mods = 'CTRL|SHIFT', action = act({ CopyTo = 'Clipboard' }) },
  { key = 'V', mods = 'CTRL|SHIFT', action = act({ PasteFrom = 'Clipboard' }) },
  -- }}}

  -- {{{ Scroll
  { key = 'U', mods = 'CTRL', action = wezterm.action.ScrollByPage(-0.5) },
  { key = 'D', mods = 'CTRL', action = wezterm.action.ScrollByPage(0.5) },
  {
    key = 'Home',
    mods = '',
    action = wezterm.action_callback(function(window, pane)
      if pane:is_alt_screen_active() then
        window:perform_action(wezterm.action({ SendKey = { key = 'Home', mods = '' } }), pane)
      else
        window:perform_action('ScrollToTop', pane)
      end
    end),
  },
  {
    key = 'End',
    mods = '',
    action = wezterm.action_callback(function(window, pane)
      if pane:is_alt_screen_active() then
        window:perform_action(wezterm.action({ SendKey = { key = 'End', mods = '' } }), pane)
      else
        window:perform_action('ScrollToBottom', pane)
      end
    end),
  },
  {
    key = 'PageUp',
    mods = '',
    action = wezterm.action_callback(function(window, pane)
      if pane:is_alt_screen_active() then
        window:perform_action(wezterm.action({ SendKey = { key = 'PageUp', mods = '' } }), pane)
      else
        window:perform_action(wezterm.action({ ScrollByPage = -1 }), pane)
      end
    end),
  },
  {
    key = 'PageDown',
    mods = '',
    action = wezterm.action_callback(function(window, pane)
      if pane:is_alt_screen_active() then
        window:perform_action(wezterm.action({ SendKey = { key = 'PageDown', mods = '' } }), pane)
      else
        window:perform_action(wezterm.action({ ScrollByPage = 1 }), pane)
      end
    end),
  },
  -- }}}

  {
    key = [[/]],
    mods = 'CTRL',
    action = wezterm.action_callback(function(window, pane)
      local selection = window:get_selection_text_for_pane(pane)
      window:perform_action(wezterm.action({ Search = { CaseInSensitiveString = selection } }), pane)
    end),
  },

  { key = 'Backspace', mods = 'CTRL', action = { SendKey = { key = 'w', mods = 'CTRL' } } },

  { key = 'P', mods = 'CTRL', action = wezterm.action.QuickSelect }, -- select path
  { key = 'L', mods = 'CTRL|SHIFT', action = wezterm.action.QuickSelectArgs({ patterns = { '^.+$' } }) }, -- select line
  { key = 'F', mods = 'CTRL|SHIFT', action = wezterm.action.Search({ Regex = '' }) }, -- search regex
  {
    key = 'O',
    mods = 'CTRL|SHIFT',
    action = wezterm.action({
      QuickSelectArgs = {
        label = 'open url',
        patterns = {
          'https?://\\S+',
        },
        action = wezterm.action_callback(function(window, pane)
          local url = window:get_selection_text_for_pane(pane)
          wezterm.log_info('opening: ' .. url)
          wezterm.open_with(url)
        end),
      },
    }),
  },

  { key = 'o', mods = 'ALT', action = wezterm.action.ShowLauncher },

  -- Close Pane/Tab {{{
  {
    key = 'q',
    mods = 'CTRL',
    action = wezterm.action.CloseCurrentPane({ confirm = true }),
  },
  {
    key = 'x',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentTab({ confirm = true }),
  },
  -- }}}

  -- Split {{{
  {
    key = '|',
    mods = 'CTRL|SHIFT',
    action = wezterm.action({ SplitHorizontal = { domain = 'CurrentPaneDomain' } }),
  },
  {
    key = '_',
    mods = 'CTRL|SHIFT',
    action = wezterm.action({ SplitVertical = { domain = 'CurrentPaneDomain' } }),
  },
  -- }}}

  -- Pane {{{
  { key = 'H', mods = 'CTRL|SHIFT', action = wezterm.action({ AdjustPaneSize = { 'Left', 5 } }) },
  { key = 'J', mods = 'CTRL|SHIFT', action = wezterm.action({ AdjustPaneSize = { 'Down', 5 } }) },
  { key = 'K', mods = 'CTRL|SHIFT', action = wezterm.action({ AdjustPaneSize = { 'Up', 5 } }) },
  { key = 'L', mods = 'CTRL|SHIFT', action = wezterm.action({ AdjustPaneSize = { 'Right', 5 } }) },
  { key = 'h', mods = 'ALT', action = wezterm.action({ ActivatePaneDirection = 'Left' }) },
  { key = 'j', mods = 'ALT', action = wezterm.action({ ActivatePaneDirection = 'Down' }) },
  { key = 'k', mods = 'ALT', action = wezterm.action({ ActivatePaneDirection = 'Up' }) },
  { key = 'l', mods = 'ALT', action = wezterm.action({ ActivatePaneDirection = 'Right' }) },
  -- }}}

  -- Tab  {{{
  { key = 'n', mods = 'CTRL|SHIFT', action = wezterm.action({ SpawnTab = 'CurrentPaneDomain' }) },
  { key = '[', mods = 'ALT', action = wezterm.action({ ActivateTabRelativeNoWrap = -1 }) },
  { key = ']', mods = 'ALT', action = wezterm.action({ ActivateTabRelativeNoWrap = 1 }) },

  { key = '1', mods = 'ALT', action = wezterm.action({ ActivateTab = 0 }) },
  { key = '2', mods = 'ALT', action = wezterm.action({ ActivateTab = 1 }) },
  { key = '3', mods = 'ALT', action = wezterm.action({ ActivateTab = 2 }) },
  { key = '4', mods = 'ALT', action = wezterm.action({ ActivateTab = 3 }) },
  { key = '5', mods = 'ALT', action = wezterm.action({ ActivateTab = 4 }) },
  { key = '6', mods = 'ALT', action = wezterm.action({ ActivateTab = 5 }) },
  { key = '7', mods = 'ALT', action = wezterm.action({ ActivateTab = 6 }) },
  { key = '8', mods = 'ALT', action = wezterm.action({ ActivateTab = 7 }) },
  -- }}}

  -- {{{ Increase/Decrease font size
  { key = '=', mods = 'CTRL', action = 'IncreaseFontSize' },
  { key = '-', mods = 'CTRL', action = 'DecreaseFontSize' },
  { key = '0', mods = 'CTRL', action = 'ResetFontSize' },
  { key = 'Numpad0', mods = 'CTRL', action = 'ResetFontSize' },
  -- }}}
}

-- vim:fdl=1:fdm=marker:
