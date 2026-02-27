local palette = require("lig.colors.palette")
local Util = require("lig.util")

---@class Theme: Palette
colors = {}

for k, v in pairs(palette.get_palette("light")) do
  colors[k] = v
end

colors.bg       = colors.soft_50
colors.bg_alt   = colors.soft_200
colors.bg_float = colors.soft_50
colors.bg_reversed   = colors.soft_900
colors.bg_highlight  = colors.soft_600

colors.fg       = colors.soft_700
colors.fg_muted      = colors.soft_400
colors.fg_dim        = colors.soft_200
colors.fg_reversed   = colors.soft_100
colors.fg_strong     = colors.soft_950

return colors
