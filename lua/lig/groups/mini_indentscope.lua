local M = {}

M.url = "https://github.com/nvim-mini/mini.indentscope"

---@type lig.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniIndentscopeSymbol = { fg = c.divider },
  }
end

return M

