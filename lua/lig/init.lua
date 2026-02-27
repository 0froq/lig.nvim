---@diagnostic disable: undefined-global
local config = require("lig.config")

local M = {}
---@type {light?: string, dark?: string}
M.styles = {}

---@param opts? lig.Config
function M.load(opts)
  opts = require("lig.config").extend(opts)
  local bg = vim.o.background
  local style_bg = opts.style:find("dark") and "dark" or "light"

  if bg ~= style_bg then
    if vim.g.colors_name == "lig-" .. opts.style then
      opts.style = bg == "light" and (M.styles.light or "light") or (M.styles.dark or "dark")
    else
      vim.o.background = style_bg
    end
  end
  M.styles[vim.o.background] = opts.style
  return require("lig.theme").setup(opts)
end

M.setup = config.setup
return M
