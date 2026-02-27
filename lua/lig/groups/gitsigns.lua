local Util = require("lig.util")

local M = {}

M.url = "https://github.com/lewis6991/gitsigns.nvim"

---@type lig.HighlightsFn
function M.get(c, opts)

  -- stylua: ignore
  return {
    GitSignsAdd                   = { fg = c.git.add },
    GitSignsAddLn                 = { bg = Util.blend_bg(c.git.add, 0.2) },
    GitSignsAddNr                 = { fg = c.git.add },
    GitSignsAddCul                = { fg = c.git.add },
    GitSignsAddPreview            = { bg = Util.blend_bg(c.git.add, 0.3) },
    GitSignsAddLnInline           = { bg = Util.blend_bg(c.git.add, 0.3) },

    GitSignsChange                = { fg = c.git.change },
    GitSignsChangeLn              = { bg = Util.blend_bg(c.git.change, 0.2) },
    GitSignsChangeNr              = { fg = c.git.change },
    GitSignsChangeCul             = { fg = c.git.change },
    GitSignsChangeLnInline        = { bg = Util.blend_bg(c.git.change, 0.3) },

    GitSignsDelete                = { fg = c.git.delete },
    GitSignsDeleteVirtLn          = { bg = Util.blend_bg(c.git.delete, 0.2) },
    GitSignsDeleteNr              = { fg = c.git.delete },
    GitSignsDeleteCul             = { fg = c.git.delete },
    GitSignsDeletePreview         = { bg = Util.blend_bg(c.git.delete, 0.3) },
    GitSignsDeleteLnInline        = { bg = Util.blend_bg(c.git.delete, 0.3) },

    GitSignsAddInline             = { bg = Util.blend_bg(c.git.add, 0.3) },
    GitSignsChangeInline          = { bg = Util.blend_bg(c.git.change, 0.3) },
    GitSignsDeleteInline          = { bg = Util.blend_bg(c.git.delete, 0.3) },

    GitSignsCurrentLineBlame      = { fg = c.fg_dim },
    GitSignsVirtLnum              = { fg = c.fg_dim },

    GitSignsStagedAdd             = { fg = Util.blend_bg(c.git.add, 0.5) },
    GitSignsStagedAddLn           = { bg = Util.blend_bg(c.git.add, 0.2) },
    GitSignsStagedAddNr           = { fg = Util.blend_bg(c.git.add, 0.5) },
    GitSignsStagedAddCul          = { fg = Util.blend_bg(c.git.add, 0.5) },

    GitSignsStagedChange          = { fg = Util.blend_bg(c.git.change, 0.5) },
    GitSignsStagedChangeLn        = { bg = Util.blend_bg(c.git.change, 0.2) },
    GitSignsStagedChangeNr        = { fg = Util.blend_bg(c.git.change, 0.5) },
    GitSignsStagedChangeCul       = { fg = Util.blend_bg(c.git.change, 0.5) },

    GitSignsStagedDelete          = { fg = Util.blend_bg(c.git.delete, 0.5) },
    GitSignsStagedDeleteNr        = { fg = Util.blend_bg(c.git.delete, 0.5) },
    GitSignsStagedDeleteCul       = { fg = Util.blend_bg(c.git.delete, 0.5) },

    GitSignsStagedTopdelete       = { fg = Util.blend_bg(c.git.delete, 0.5) },
    GitSignsStagedTopdeleteNr     = { fg = Util.blend_bg(c.git.delete, 0.5) },
    GitSignsStagedTopdeleteCul    = { fg = Util.blend_bg(c.git.delete, 0.5) },

    GitSignsTopdelete             = { fg = c.git.delete },
    GitSignsTopdeleteLn           = { bg = Util.blend_bg(c.git.delete, 0.2) },
    GitSignsTopdeleteNr           = { fg = c.git.delete },
    GitSignsTopdeleteCul          = { fg = c.git.delete },

    GitSignsUntracked             = { fg = Util.blend_bg(c.git.ignore, 0.8) },
    GitSignsUntrackedLn           = { bg = Util.blend_bg(c.git.ignore, 0.5) },
    GitSignsUntrackedNr           = { fg = Util.blend_bg(c.git.ignore, 0.8) },
    GitSignsUntrackedCul          = { fg = Util.blend_bg(c.git.ignore, 0.8) },

    GitSignsChangeDelete          = { fg = c.git.change },
    GitSignsChangeDeleteLn        = { bg = Util.blend_bg(c.git.change, 0.2) },
    GitSignsChangeDeleteNr        = { fg = c.git.change },
    GitSignsChangeDeleteCul       = { fg = c.git.change },

    GitSignsStagedChangedelete    = { fg = Util.blend_bg(c.git.change, 0.5) },
    GitSignsStagedChangedeleteLn  = { bg = Util.blend_bg(c.git.change, 0.2) },
    GitSignsStagedChangedeleteNr  = { fg = Util.blend_bg(c.git.change, 0.5) },
    GitSignsStagedChangedeleteCul = { fg = Util.blend_bg(c.git.change, 0.5) },
  }
end

return M
