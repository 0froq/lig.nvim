local Util = require("lig.util")
local M = {}

M.url = "https://github.com/nvim-mini/mini.snippets"

---@type lig.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniSnippetsCurrent = { underdouble = true, sp = c.fg_strong },
    MiniSnippetsCurrentReplace = { underdouble = true, sp = c.yellow[2] },
    MiniSnippetsFinal = { underdouble = true, sp = c.red[2] },
    MiniSnippetsUnvisited = { underdouble = true, sp = c.fg },
    MiniSnippetsVisited = { underdouble = true, sp = c.fg_muted }
  }
end

return M
