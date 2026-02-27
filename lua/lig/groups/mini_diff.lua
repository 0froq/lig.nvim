local Util = require("lig.util")
local M = {}

M.url = "https://github.com/nvim-mini/mini.diff"

---@type lig.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniDiffSignAdd = { fg = c.git.add },
    MiniDiffSignChange = { fg = c.git.change },
    MiniDiffSignDelete = { fg = c.git.delete },
    MiniDiffOverAdd = { bg = Util.blend_bg(c.git.add, 0.5) },
    MiniDiffOverChange = { bg = Util.blend_bg(c.git.change, 0.3) },
    MiniDiffOverChangeBuf = { bg = Util.blend_bg(c.git.change, 0.5) },
    MiniDiffOverContext = { bg = Util.blend_bg(c.bg_selection, 0.5) },
    MiniDiffOverContextBuf = { bg = Util.blend_bg(c.bg_selection, 0.8) },
    MiniDiffOverDelete = { bg = Util.blend_bg(c.git.delete, 0.3) },
  }
end

return M
