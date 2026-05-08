---@diagnostic disable: undefined-global
local Util = require("lig.util")
local M = {}

local gen_triad = function(base)
  return {
    Util.blend_fg(base, 0.6),
    base,
    Util.blend_bg(base, 0.6),
  }
end

---@class Colors
local color = {
  red = gen_triad("#fa6a6a"),
  green = gen_triad("#6aca9a"),
  yellow = gen_triad("#faca6a"),
  blue = gen_triad("#6a9afa"),
  magenta = gen_triad("#ca6a9a"),
  cyan = gen_triad("#6acaca"),

  orange = gen_triad("#fa9a6a"),
  azure = gen_triad("#0acafa"),
}

---@class GrayScale
local gray_scale = {
  black = "#000000",
  white = "#ffffff",

  soft_50 = "#fafafa",
  soft_100 = "#f5f5f5",
  soft_200 = "#e5e5e5",
  soft_300 = "#d4d4d4",
  soft_400 = "#a1a1a1",
  soft_500 = "#737373",
  soft_600 = "#525252",
  soft_700 = "#404040",
  soft_800 = "#262626",
  soft_900 = "#171717",
  soft_950 = "#0a0a0a",
}

M.get_palette = function(style)
  -- concat table
  if style == "light" then
    for k, v in pairs(color) do
      color[k] = { v[3], v[2], v[1] }
    end
  end

  ---@class Palette: GrayScale, Colors
  palette = vim.tbl_deep_extend("force", color, gray_scale)

  return palette
end

M.get_palette()

return M
