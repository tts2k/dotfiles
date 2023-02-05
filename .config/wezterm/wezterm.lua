local wezterm = require 'wezterm'
local act = wezterm.action

-- Colorscheme
local colors = {
  foreground = "#dcd7ba",
  background = "#1f1f28",

  cursor_bg = "#c8c093",
  cursor_fg = "#c8c093",
  cursor_border = "#c8c093",

  selection_fg = "#c8c093",
  selection_bg = "#2d4f67",

  scrollbar_thumb = "#16161d",
  split = "#16161d",

  ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
  brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
  indexed = { [16] = "#ffa066", [17] = "#ff5d62" },

  tab_bar = {
    background = "1f1f28",
    active_tab = {
      bg_color = "#54546d",
      fg_color = "#16161d"
    },
    inactive_tab = {
      bg_color = "#16161d",
      fg_color = "#54546d"
    },
    new_tab = {
      bg_color = "#54546d",
      fg_color = "#16161d"
    },
  }
}

local basename = function(s)
  return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

local remove_host = function(s)
  local colon = string.find(s, ':')
  if colon ~= nil then
    return string.sub(s, colon)
  else
    return s
  end
end

local title_icon_table = {
  nvim = ' ',
  bash = ' ',
}

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local pane = tab.active_pane
    local title = basename(pane.foreground_process_name)
    if title == '' then
      title = 'bash'
    end

    local icon = title_icon_table.bash
    if title_icon_table[title] ~= nil then
      icon = title_icon_table[title]
    end

    if title == 'bash' then
      title = remove_host(pane.title)
    end

    if #title > max_width then
      title = wezterm.truncate_right(title, max_width - 8)
    end

    local title_end = '  '
    if (not tab.is_active) or (tab.tab_index == #tabs - 1) then
      title_end = ' |'
    end

    return {
      { Text = '  ' .. icon .. ' ' .. title .. title_end },
    }
  end
)

-- Keys
local leader = { key = ' ', mods = 'CTRL', timeout_miliseconds = 1000 }
local keys = {
  {
    key = 'x',
    mods = 'LEADER',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  {
    key = 'v',
    mods = 'LEADER',
    action = act.SplitVertical { domain = "CurrentPaneDomain" }
  },
  {
    key = 'd',
    mods = 'LEADER',
    action = act.CloseCurrentPane { confirm = true }
  },
  {
    key = 'o',
    mods = 'LEADER',
    action = act.SpawnTab 'CurrentPaneDomain'
  },
  {
    key = 'w',
    mods = 'LEADER',
    action = act.CloseCurrentTab { confirm = true }
  },
  {
    key = 'T',
    mods = 'LEADER',
    action = act.ActivateTabRelative(-1)
  },
  {
    key = 't',
    mods = 'LEADER',
    action = act.ActivateTabRelative(1)
  },
  {
    key = 'C',
    mods = 'CTRL',
    action = act.CopyTo 'Clipboard'
  },
  {
    key = 'V',
    mods = 'CTRL',
    action = act.PasteFrom 'Clipboard'
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = act.ActivateCopyMode
  },
  {
    key = 'k',
    mods = 'LEADER',
    action = act.ActivatePaneDirection 'Up'
  },
  {
    key = 'j',
    mods = 'LEADER',
    action = act.ActivatePaneDirection 'Down'
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = act.ActivatePaneDirection 'Right'
  },
  {
    key = 'h',
    mods = 'LEADER',
    action = act.ActivatePaneDirection 'Left'
  },
  {
    key = 'K',
    mods = 'CTRL',
    action = act.AdjustPaneSize({"Up", 1})
  },
  {
    key = 'J',
    mods = 'CTRL',
    action = act.AdjustPaneSize({"Down", 1})
  },
  {
    key = 'L',
    mods = 'LEADER',
    action = act.AdjustPaneSize({"Right", 1})
  },
  {
    key = 'H',
    mods = 'LEADER',
    action = act.AdjustPaneSize({"Left", 1})
  },
  {
    key = 'F',
    mods = 'LEADER',
    action = act.TogglePaneZoomState
  },
  {
    key = 'p',
    mods = 'LEADER',
    action = act.PaneSelect
  },
  {
    key = '\\',
    mods = 'LEADER',
    action = act.CharSelect
  },
  {
    key = '-',
    mods = 'CTRL',
    action = act.DecreaseFontSize
  },
  {
    key = '=',
    mods = 'CTRL',
    action = act.IncreaseFontSize
  },
  {
    key = '0',
    mods = 'CTRL',
    action = act.ResetFontSize
  }
}

for i = 1, 8 do
  table.insert(keys, {
    key = tostring(i),
    mods = 'ALT',
    action = act.ActivateTab(i - 1)
  })
end

local ssh_domains = {
  {
    name = 'neo.venezia',
    remote_address = '192.168.1.18',
    username = 'noire'
  }
}

return {
  font = wezterm.font{
    family = 'Cascadia Code',
    weight = 'Regular'
  },
  font_size = 12,
  adjust_window_size_when_changing_font_size = false,

  force_reverse_video_cursor = true,
  colors = colors,
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  show_tab_index_in_tab_bar = false,
  switch_to_last_active_tab_when_closing_tab = true,
  tab_max_width = 30,
  animation_fps = 1,
  cursor_blink_ease_in = "Constant",
  cursor_blink_ease_out = "Constant",

  use_dead_keys = false,
  disable_default_key_bindings = true,
  leader = leader,
  keys = keys,
  ssh_domains = ssh_domains,
}
