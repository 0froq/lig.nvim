local util = require("lig.util")

local M = {}

--- @param colors ColorScheme
function M.generate(colors)
  local kitty = util.template(
    [[
# vim:ft=kitty

## name: ${_style_name}
## license: MIT
## author: froQ
## upstream: ${_upstream_url}


background ${bg}
foreground ${fg}
selection_background ${bg_selection}
selection_foreground ${fg}
url_color ${teal[2]}
cursor ${fg}
cursor_text_color ${bg}

# Tabs
active_tab_background ${bg_reversed}
active_tab_foreground ${fg_reversed}
inactive_tab_background ${bg_alt}
inactive_tab_foreground ${fg_muted}
#tab_bar_background ${fg}

# Windows
active_border_color ${border}
inactive_border_color ${bg_alt}

# normal
color0 ${terminal.black}
color1 ${terminal.red}
color2 ${terminal.green}
color3 ${terminal.yellow}
color4 ${terminal.blue}
color5 ${terminal.magenta}
color6 ${terminal.cyan}
color7 ${terminal.white}

# bright
color8  ${terminal.black_bright}
color9  ${terminal.red_bright}
color10 ${terminal.green_bright}
color11 ${terminal.yellow_bright}
color12 ${terminal.blue_bright}
color13 ${terminal.magenta_bright}
color14 ${terminal.cyan_bright}
color15 ${terminal.white_bright}

# extended colors
color16 ${coral[2]}
color17 ${azure[2]}
]],
    colors
  )
  return kitty
end

return M
