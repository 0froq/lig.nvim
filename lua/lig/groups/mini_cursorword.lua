local Util = require("lig.util")
local M = {}

M.url = "https://github.com/nvim-mini/mini.cursorword"

---@type lig.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniCursorword = { bg = Util.blend_bg(c.accent1, 0.2) },
    MiniCursorwordCurrent = { bg = Util.blend_bg(c.accent1, 0.3) },
  }
end

return M
