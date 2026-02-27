local Util = require("lig.util")
local M = {}

M.url = "https://github.com/nvim-mini/mini.clue"

---@type lig.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniClueBorder = { fg = c.border, bg = c.bg_float },
    MiniClueDescGroup = { fg = c.fg_muted, italic = true },
    MiniClueDescSingle = { fg = c.fg },
    MiniClueNextKey = { fg = c.fg_strong },
    MiniClueNextKeyWithPostkeys = { fg = c.accent1 },
    MiniClueSeparator = { fg = c.fg_muted },
    MiniClueTitle = { fg = c.fg_strong, bg = c.bg_float },
  }
end

return M
