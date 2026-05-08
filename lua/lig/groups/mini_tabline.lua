local M = {}

M.url = "https://github.com/nvim-mini/mini.statusline"

---@type lig.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniTablineCurrent = { fg = c.fg_reversed, bg = c.bg_reversed },
    MiniTablineVisible = { fg = c.fg, bg = c.bg_statusline },
    MiniTablineHidden = { fg = c.fg_muted, bg = c.bg_statusline },
    MiniTablineModifiedCurrent = { fg = c.fg_reversed, bg = c.git.change },
    MiniTablineModifiedVisible = { bg = c.bg_statusline, fg = c.git.change },
    MiniTablineModifiedHidden = { bg = c.bg_statusline, fg = c.git.delete },
    MiniTablineFill = { bg = c.bg_statusline },
    MiniTablineTabpagesection = { fg = c.fg_strong, bg = c.bg_statusline },
    MiniTablineTrunc = { fg = c.fg_muted },
  }
end

return M
