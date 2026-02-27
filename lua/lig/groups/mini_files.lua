local M = {}

M.url = "https://github.com/nvim-mini/mini.files"

---@type lig.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniFilesBorder = { fg = c.border, bg = c.bg },
    MiniFilesBorderModified = { fg = c.git.change, bg = c.bg },
    MiniFilesCursorLine = { fg = c.fg_strong, bg = c.bg_selection },
    MiniFilesDirectory = { fg = c.fg_muted, bg = c.bg },
    MiniFilesFile = { bg = c.bg },
    MiniFilesNormal = { bg = c.bg },
    MiniFilesTitle = { bg = c.bg_folded, fg = c.fg_strong },
    MiniFilesTitleFocused = { fg = c.fg_reversed, bg = c.bg_reversed, bold = true },
  }
end

return M

