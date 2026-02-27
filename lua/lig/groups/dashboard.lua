local M = {}

M.url = "https://github.com/nvimdev/dashboard-nvim"

---@type lig.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    -- General
    DashboardHeader           = { fg = c.accent1 },
    DashboardFooter           = { fg = c.accent1 },
    -- Hyper theme
    DashboardProjectTitle     = { fg = c.fg_strong },
    DashboardProjectTitleIcon = { fg = c.accent2 },
    DashboardProjectIcon      = { fg = c.accent2 },
    DashboardMruTitle         = { fg = c.fg_strong },
    DashboardMruIcon          = { fg = c.accent2 },
    DashboardFiles            = { fg = c.fg },
    DashboardShortCutIcon     = { fg = c.fg },
    -- Doome theme
    DashboardDesc             = { fg = c.accent1 },
    DashboardKey              = { fg = c.accent2 },
    DashboardIcon             = { fg = c.accent1 },
    DashboardShortCut         = { fg = c.accent1 },
  }
end

return M
