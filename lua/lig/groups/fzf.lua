local M = {}

M.url = "https://github.com/ibhagwan/fzf-lua"

---@type lig.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    FzfLuaBackdrop = { bg = c.bg },
    FzfLuaBorder = { fg = c.border },
    -- TelescopeMatching = { fg = c.accent1, underline = true },
    -- TelescopeSelection = { bg = c.bg_selection, fg = c.fg_strong },
    -- TelescopeSelectionCaret = { bg = c.bg_selection, fg = c.fg_strong },
    -- TelescopeTitle = { fg = c.fg_strong },
    -- TelescopeBorder = { fg = c.border },
    -- TelescopeNormal = { bg = c.bg_float },
  }
end

return M
