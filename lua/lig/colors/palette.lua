---@diagnostic disable: undefined-global
local M = {}

---@class Colors
local color = {
  rose = {
    "#f7c7c7",
    "#e79a9a",
    "#a45b5b",
  },
  coral = {
    "#f6bf9f",
    "#e0926d",
    "#9b5a36",
  },
  amber = {
    "#f1d89b",
    "#d7b366",
    "#916f3b",
  },
  cyan = {
    "#a2e1e1",
    "#68b7b7",
    "#3a7878",
  },
  teal = {
    "#9adcc0",
    "#60b89a",
    "#376f5a",
  },
  azure = {
    "#aacdf7",
    "#6fa8f0",
    "#3f6496",
  },
  indigo = {
    "#b8bae8",
    "#8286d4",
    "#4c4f93",
  },
  moss = {
    "#bedba6",
    "#87b173",
    "#526b46",
  },
  olive = {
    "#d6cf95",
    "#a69c60",
    "#6a643a",
  },
  emerald = {
    "#a3e4b8",
    "#69c493",
    "#387a55",
  },
  sage = {
    "#cadcc7",
    "#98b29a",
    "#627662",
  },
  mauve = {
    "#d2b7e0",
    "#a67dbe",
    "#6a4f88",
  },
  plum = {
    "#e1b9d5",
    "#b57aa7",
    "#774d70",
  },
  iris = {
    "#b8b7e5",
    "#8885c8",
    "#545295",
  },
}

---@class GrayScale
local gray_scale = {
  black    = "#000000",
  white    = "#ffffff",

  soft_50  = "#fff9f5",
  soft_100 = "#e7e2de",
  soft_200 = "#cfcac7",
  soft_300 = "#b7b3b0",
  soft_400 = "#9f9c99",
  soft_500 = "#878583",
  soft_600 = "#6f6d6c",
  soft_700 = "#575655",
  soft_800 = "#3f3f3e",
  soft_900 = "#272727",
  soft_950 = "#0f1010",
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
