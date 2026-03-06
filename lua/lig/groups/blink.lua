local Util = require("lig.util")
local M = {}

M.url = "https://github.com/saghen/blink.cmp"

---@type lig.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore

  local kinds = {
    'Array',
    'Boolean',
    'Class',
    'Color',
    'Constant',
    'Constructor',
    'Enum',
    'EnumMember',
    'Event',
    'Field',
    'File',
    'Folder',
    'Function',
    'Interface',
    'Key',
    'Keyword',
    'Method',
    'Module',
    'Namespace',
    'Null',
    'Number',
    'Object',
    'Operator',
    'Package',
    'Property',
    'Reference',
    'Snippet',
    'String',
    'Struct',
    'Unit',
    'Text',
    'TypeParameter',
    'Variable',
    'Value',
  }

  local lsp_kind = {}

  for _, kind in ipairs(kinds) do
    lsp_kind['BlinkCmpKind' .. kind] = 'LspKind' .. kind
  end

  local hl = {
    BlinkCmpMenuBorder = { fg = c.border },
    BlinkCmpLabelDeprecated = { fg = c.fg_muted, strikethrough = true },
  }

  return vim.tbl_deep_extend("force", hl, lsp_kind)
end

return M
