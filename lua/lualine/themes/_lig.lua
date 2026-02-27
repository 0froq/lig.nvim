local M = {}

---@param style? string
function M.get(style)
  local colors, config = require("lig.colors").setup({
    style = style,
  })

  local hl = {}

  hl.normal = {
    a = { bg = colors.teal, fg = colors.fg_reversed },
    b = { bg = colors.bg_statusline, fg = colors.teal },
    c = { bg = colors.bg, fg = colors.fg },
  }

  hl.insert = {
    a = { bg = colors.bg_reversed, fg = colors.fg_reversed },
    b = { bg = colors.bg_statusline, fg = colors.fg_strong },
  }

  hl.command = {
    a = { bg = colors.coral, fg = colors.fg_reversed },
    b = { bg = colors.bg_statusline, fg = colors.coral },
  }

  hl.visual = {
    a = { bg = colors.azure, fg = colors.fg_reversed },
    b = { bg = colors.bg_statusline, fg = colors.azure },
  }

  hl.replace = {
    a = { bg = colors.rose, fg = colors.fg_reversed },
    b = { bg = colors.bg_statusline, fg = colors.rose },
  }

  hl.terminal = {
    a = { bg = colors.moss, fg = colors.fg_reversed },
    b = { bg = colors.bg_statusline, fg = colors.moss },
  }

  hl.inactive = {
    a = { bg = colors.bg_statusline, fg = colors.fg },
    b = { bg = colors.bg_statusline, fg = colors.fg_muted, gui = "bold" },
    c = { bg = colors.bg_statusline, fg = colors.fg_muted },
  }

  if config.lualine_bold then
    for _, mode in pairs(hl) do
      mode.a.gui = "bold"
    end
  end
  return hl
end

return M
