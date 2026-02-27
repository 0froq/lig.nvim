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
    WhichKeylconBlue   = { fg = c.iris[2] },
    WhichKeylconCyan   = { fg = c.cyan[2] },
    WhichKeylconGreen  = { fg = c.moss[2] },
    WhichKeylconGrey   = { fg = c.fg_muted },
    WhichKeylconOrange = { fg = c.coral[2] },
    WhichKeylconPurple = { fg = c.mauve[2] },
    WhichKeylconRed    = { fg = c.rose[2] },
    WhichKeylconYellow = { fg = c.amber[2] },
    WhichKeyNormal     = { bg = c.bg_float },
    WhichKeySeparator  = { fg = c.fg_muted },
    WhichKeyTitle      = { fg = c.fg_strong, bg = c.bg_float },
    WhichKeyValue      = { fg = c.fg },
  }
end

return M
