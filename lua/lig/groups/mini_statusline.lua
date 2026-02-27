local M = {}

M.url = "https://github.com/nvim-mini/mini.statusline"

---@type lig.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniStatuslineModeNormal = { fg = c.fg_reversed, bg = c.mode.normal },
    MiniStatuslineModeInsert = { fg = c.fg_reversed, bg = c.mode.insert },
    MiniStatuslineModeVisual = { fg = c.fg_reversed, bg = c.mode.visual },
    MiniStatuslineModeReplace = { fg = c.fg_reversed, bg = c.mode.replace },
    MiniStatuslineModeCommand = { fg = c.fg_reversed, bg = c.mode.command },
    MiniStatuslineModeOther = { fg = c.fg_reversed, bg = c.mode.other },

    MiniStatuslineDevinfo = { fg = c.fg },
    MiniStatuslineFilename = { fg = c.fg_muted },
    MiniStatuslineFileinfo = { fg = c.fg_muted },
    MiniStatuslineInactive = { fg = c.fg_dim }
  }
end

return M
