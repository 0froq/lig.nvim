local M = {}

M.url = "https://github.com/nvim-mini/mini.statusline"

---@type lig.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniTablineCurrent = { fg = c.fg_reversed, bg = c.bg_reversed },
    MiniTablineVisible = { fg = c.fg, bg = c.bg_folded },
    MiniTablineHidden = { fg = c.fg_muted, bg = c.bg_alt },
    MiniTablineModifiedCurrent = { fg = c.fg_reversed, bg = c.amber[1] },
    MiniTablineModifiedVisible = { fg = c.fg_reversed, bg = c.amber[3] },
    MiniTablineModifiedHidden = { fg = c.fg_reversed, bg = c.rose[3] },
    MiniTablineFill = { bg = c.bg },
    MiniTablineTabpagesection = { fg = c.fg_strong, bg = c.bg_folded },
    MiniTablineTrunc = { fg = c.fg_muted },
  }
end

return M
