---@class lig.ColorSource
local M = {}

---@type table<string, string>
M.accents = {
  red = '#fa6a6a',
  green = '#6aca9a',
  yellow = '#faca6a',
  blue = '#6a9afa',
  magenta = '#ca6a9a',
  cyan = '#6acaca',
  orange = '#fa9a6a',
  azure = '#0acafa',
}

---@type table<string, string>
M.neutrals = {
  black    = "#000000",
  white    = "#ffffff",

  soft_50  = "#fafafa",
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

return M
