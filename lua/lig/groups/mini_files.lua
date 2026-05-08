local M = {}

M.url = "https://github.com/nvim-mini/mini.files"

---@type lig.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniFilesBorder = { fg = c.border, bg = c.bg },
    MiniFilesBorderModified = { fg = c.git.change, bg = c.bg },
    MiniFilesCursorLine = { fg = c.fg_strong, bg = c.bg_selection },
    MiniFilesDirectory = { fg = c.fg, bg = c.bg },
    MiniFilesFile = { fg = c.fg_muted, bg = c.bg },
    MiniFilesNormal = { bg = c.bg },
    MiniFilesTitle = { fg = c.fg_muted },
    MiniFilesTitleFocused = { fg = c.fg_strong, bold = true },
  }
end

return M
