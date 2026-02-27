local palette = require("lig.colors.palette")
local Util = require("lig.util")

---@class Theme: Palette
colors = {}

for k, v in pairs(palette.get_palette("dark")) do
  colors[k] = v
end

colors.bg       = Util.blend_fg(colors.soft_950, 0.9)
colors.bg_alt   = colors.soft_900
colors.bg_alt        = colors.soft_900
colors.bg_float      = colors.soft_900
colors.bg_reversed   = colors.soft_100
colors.bg_highlight  = colors.soft_400

colors.fg       = colors.soft_300
colors.fg_muted      = colors.soft_600
colors.fg_dim        = colors.soft_800
colors.fg_reversed   = colors.soft_900
colors.fg_strong     = colors.soft_50

return colors
