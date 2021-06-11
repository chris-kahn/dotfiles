local colors = {
    dark = {
        red          = '#fb4934',
        green        = '#b8bb26',
        blue         = '#83a598',
        yellow       = '#fabd2f',
        purple       = '#d3869b',
        aqua         = '#8ec07c',
        gray         = '#928374',
        orange       = '#fe8019',
        bg0          = '#282828',
        bg0_s        = '#32302f',
        bg1          = '#3c3836',
        bg2          = '#504945',
        bg3          = '#665c54',
        bg4          = '#7c6f64',
        fg0          = '#fbf1c7',
        fg1          = '#ebdbb2',
        fg2          = '#d5c4a1',
        fg3          = '#bdae93',
        fg4          = '#a89984'
    },
    light = {
        red          = '#9d0006',
        green        = '#79740e',
        blue         = '#076678',
        yellow       = '#b56614',
        purple       = '#8f3f71',
        aqua         = '#427b58',
        gray         = '#928374',
        orange       = '#d65d0e',
        bg0          = '#fbf1c7',
        bg0_s        = '#f2e5bc',
        bg1          = '#ebdbb2',
        bg2          = '#d5c4a1',
        bg3          = '#bdae93',
        bg4          = '#a89984',
        fg0          = '#282828',
        fg1          = '#3c3836',
        fg2          = '#504945',
        fg3          = '#665c54',
        fg4          = '#7c6f64'
    }
}

function getTheme(mode)
    local theme = {}

    theme.normal = {
      a = {bg = colors[mode].gray, fg = colors[mode].bg0, gui = 'bold'},
      b = {bg = colors[mode].bg2, fg = colors[mode].fg1},
      c = {bg = colors[mode].bg0_s, fg = colors[mode].gray}
    }

    theme.insert = {
      a = {bg = colors[mode].blue, fg = colors[mode].bg0, gui = 'bold'},
      b = {bg = colors[mode].bg2, fg = colors[mode].fg1},
      c = {bg = colors[mode].bg0_s, fg = colors[mode].gray}
    }

    theme.visual = {
      a = {bg = colors[mode].yellow, fg = colors[mode].bg0, gui = 'bold'},
      b = {bg = colors[mode].bg2, fg = colors[mode].fg1},
      c = {bg = colors[mode].bg0_s, fg = colors[mode].gray}
    }

    theme.replace = {
      a = {bg = colors[mode].red, fg = colors[mode].bg0, gui = 'bold'},
      b = {bg = colors[mode].bg2, fg = colors[mode].fg1},
      c = {bg = colors[mode].bg0_s, fg = colors[mode].gray}
    }

    theme.command = {
      a = {bg = colors[mode].green, fg = colors[mode].bg0, gui = 'bold'},
      b = {bg = colors[mode].bg2, fg = colors[mode].fg1},
      c = {bg = colors[mode].bg0_s, fg = colors[mode].gray}
    }

    theme.inactive = {
      a = {bg = colors[mode].bg2, fg = colors[mode].gray, gui = 'bold'},
      b = {bg = colors[mode].bg1, fg = colors[mode].gray},
      c = {bg = colors[mode].bg0_s, fg = colors[mode].gray}
    }
    return theme
end

return getTheme
