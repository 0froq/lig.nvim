local M = {}

M.url = "https://github.com/folke/which-key.nvim"

---@type lig.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    WhichKey           = { fg = c.fg_strong },
    WhichKeyBorder     = { fg = c.border, bg = c.bg_float },
    WhichKeyDesc       = { fg = c.fg },
    WhichKeyGroup      = { fg = c.fg_muted, italic = true },
    WhichKeyIcon       = { fg = c.accent2 },
    WhichKeylconAzure  = { fg = c.azure[2] },
    WhichKeylconBlue   = { fg = c.blue[2] },
    WhichKeylconCyan   = { fg = c.cyan[2] },
    WhichKeylconGreen  = { fg = c.green[2] },
    WhichKeylconGrey   = { fg = c.fg_muted },
    WhichKeylconOrange = { fg = c.orange[2] },
    WhichKeylconPurple = { fg = c.magenta[2] },
    WhichKeylconRed    = { fg = c.red[2] },
    WhichKeylconYellow = { fg = c.yellow[2] },
    WhichKeyNormal     = { bg = c.bg_float },
    WhichKeySeparator  = { fg = c.fg_muted },
    WhichKeyTitle      = { fg = c.fg_strong, bg = c.bg_float },
    WhichKeyValue      = { fg = c.fg },
  }
end

return M
