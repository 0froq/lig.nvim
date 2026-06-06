---@diagnostic disable: undefined-global
local Util = require("lig.util")

local M = {}

---@type table<string, Theme|fun(opts:lig.Config):Theme>
M.styles = setmetatable({}, {
  __index = function(_, style)
    return vim.deepcopy(Util.mod("lig.colors." .. style))
  end,
})

---@param opts? lig.Config
function M.setup(opts)
  opts = require("lig.config").extend(opts)

  Util.mono = opts.mono.enabled or false
  Util.day_brightness = opts.day_brightness

  local palette = M.styles[opts.style]
  if type(palette) == "function" then
    palette = palette(opts) --[[@as Theme]]
  end

  ---@type ColorScheme
  local colors = palette

  opts.on_colors(colors)

  return colors, opts
end

return M
