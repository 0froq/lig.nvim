local Util = require("lig.util")
local M = {}

M.url = "https://github.com/nvim-mini/mini.completion"

---@type lig.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniCompletionActiveParameter = { bg = c.bg_selection },
    MiniCompletionDeprecated = { fg = c.fg_dim, strikethrough = true },
    MiniCompletionInfoBorderOutdated = { fg = c.diag.warn }
  }
end

return M
