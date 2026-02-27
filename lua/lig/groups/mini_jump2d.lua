local M = {}

M.url = "https://github.com/nvim-mini/mini.jump2d"

---@type lig.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniJump2dSpot = { fg = c.fg, italic = false },
    MiniJump2dSpotUnique = { fg = c.fg_strong, undercurl = true, bold = true, sp = c.accent1 },
    MiniJump2dSpotAhead = { fg = c.fg_strong, underline = true, sp = c.accent1 },
    MiniJump2dDim = { fg = c.fg_dim },
  }
end

return M

