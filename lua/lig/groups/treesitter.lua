local Util = require("lig.util")

local M = {}

---@type lig.HighlightsFn
---@param c ColorScheme
function M.get(c, opts)
  local style = opts.style:find("dark") and "dark" or "light"

  local ret = {
    -- Structure
    ["@module"]                     = { fg = c.struct[2] },
    ["@module.builtin"]             = { fg = c.struct[1] },

    ["@tag"]                        = { fg = c.struct[2] },
    ["@tag.builtin"]                = { fg = c.struct[1] },

    ["@attribute"]                  = { fg = c.struct[2] },
    ["@attribute.builtin"]          = { fg = c.struct[2] },

    ["@variable.parameter"]         = { fg = c.struct[2] },
    ["@variable.parameter.builtin"] = { fg = c.struct[1] },

    ["@keyword.modifier"]           = { fg = c.struct[2] },
    ["@keyword.directive"]          = { fg = c.struct[2] },
    ["@keyword.directive.define"]   = { fg = c.struct[2] },
    -- ["@keyword.storage"]            = { fg = c.struct[2] },

    -- Action
    ["@function"]                   = { fg = c.action[1] },
    ["@function.method"]            = { fg = c.action[1] },
    ["@function.builtin"]           = { fg = c.action[1] },
    ["@function.macro"]             = { fg = c.action[1] },

    ["@function.call"]              = { fg = c.action[2] },
    ["@function.method.call"]       = { fg = c.action[2] },

    ["@keyword.coroutine"]          = { fg = c.action[2] },
    ["@keyword.return"]             = { fg = c.action[2] },
    ["@keyword.debug"]              = { fg = c.action[2] },
    ["@keyword.exception"]          = { fg = c.action[2] },

    -- Ref
    ["@variable.builtin"]           = { fg = c.ref[1] },

    ["@string.escape"]              = { fg = c.ref[1] },
    ["@string.regexp"]              = { fg = c.ref[1] },
    ["@character.special"]          = { fg = c.ref[1] },

    ["@boolean"]                    = { fg = c.ref[2] },
    ["@number"]                     = { fg = c.ref[2] },
    ["@number.float"]               = { fg = c.ref[2] },

    ["@constant"]                   = { fg = c.ref[2] },
    ["@constant.builtin"]           = { fg = c.ref[1] },
    ["@constant.macro"]             = { fg = c.ref[1] },

    ["@character.printf"]           = { fg = c.ref[2] },
    ["@label"]                      = { fg = c.ref[2] },

    ["@type.definition"]            = { fg = c.ref[1] },
    ["@type"]                       = { fg = c.ref[3] },
    ["@type.builtin"]               = { fg = c.ref[3] },
    -- ["@type.qualifier"]             = { fg = c.ref[2] },

    -- Mono
    ["@character"]                  = { fg = c.mono[1] },

    ["@variable"]                   = { fg = c.mono[1] },
    ["@variable.member"]            = { fg = c.mono[2] },
    ["@property"]                   = { fg = c.mono[2] },
    ["@tag.attribute"]              = { fg = c.mono[2] },

    ["@keyword"]                    = { fg = c.mono[2] },
    ["@keyword.import"]             = { fg = c.mono[2] },
    ["@keyword.type"]               = { fg = c.mono[2] },
    ["@keyword.repeat"]             = { fg = c.mono[2] },
    ["@keyword.conditional"]        = { fg = c.mono[2] },
    ["@keyword.conditional.ternary"]= { fg = c.mono[2] },
    ["@keyword.function"]           = { fg = c.mono[2] },

    ["@string"]                     = { fg = c.mono[3] },
    ["@string.documentation"]       = { fg = c.mono[3] },

    ["@string.special"]             = { fg = c.mono[2] },
    ["@string.special.url"]         = { fg = c.mono[2], underline = true },
    ["@string.special.symbol"]      = { fg = c.mono[2] },
    ["@string.special.path"]        = { fg = c.mono[2] },

    ["@constructor"]                = { fg = c.mono[2] },

    ["@operator"]                   = { fg = c.mono[3] },
    ["@keyword.operator"]           = { fg = c.mono[3] },

    ["@punctuation"]                = { fg = c.mono[3] },
    ["@punctuation.special"]        = { fg = c.mono[3] },
    ["@punctuation.bracket"]        = { fg = c.mono[3] },
    ["@punctuation.delimiter"]      = { fg = c.mono[3] },
    ["@tag.delimiter"]              = { fg = c.mono[3] },

    ["@comment"]                    = { fg = c.mono[3] },
    ["@comment.documentation"]      = { fg = c.mono[3] },       -- 文档注释稍提亮
    ["@comment.error"]              = { fg = c.comments.error },
    ["@comment.warning"]            = { fg = c.comments.warning },
    ["@comment.note"]               = { fg = c.comments.note },
    ["@comment.todo"]               = { fg = c.comments.todo },
    -- ["@parameter"]                  = { fg = c.rose[2] },

    ["@markup"]                = { fg = c.fg },
    ["@markup.strong"]         = { bold = true, fg = c.fg_strong },
    ["@markup.italic"]         = { italic = true },
    ["@markup.strikethrough"]  = { strikethrough = true },
    ["@markup.underline"]      = { underline = true, opts.styles.underline },
    ["@markup.heading"]        = { fg = c.fg_strong },
    ["@markup.heading.1"]      = { fg = c.fg_strong, bold = true },
    ["@markup.heading.2"]      = { fg = c.fg_strong, bold = true },
    ["@markup.heading.3"]      = { fg = c.fg_strong, bold = true },
    ["@markup.heading.4"]      = { fg = c.fg_strong, bold = true },
    ["@markup.heading.5"]      = { fg = c.fg_strong, bold = true },
    ["@markup.heading.6"]      = { fg = c.fg_strong, bold = true },
    ["@markup.quote"]          = { fg = c.mono[2], italic = true },
    ["@markup.math"]           = { fg = c.action[2] },
    ["@markup.link"]           = { fg = c.ref[2] },
    ["@markup.link.label"]     = { fg = c.mono[2] },
    ["@markup.link.url"]       = { fg = c.mono[2], underline = true },
    ["@markup.raw"]            = { fg = c.mono[2] },
    ["@markup.raw.block"]      = { fg = c.mono[2] },
    ["@markup.list"]           = { fg = c.fg },
    ["@markup.list.checked"]   = { fg = c.msg.success },
    ["@markup.list.unchecked"] = { fg = c.fg },

    ["@diff.plus"]             = { fg = c.git.add },
    ["@diff.minus"]            = { fg = c.git.delete },
    ["@diff.delta"]            = { fg = c.git.change },

    ["@diff"]                  = {},

    -- Mending
  --   -- markdown
  --   MarkdownLinkText           = "@markup.link",
  --   MarkdownUrl                = "@markup.link.url",
  --   MarkdownCode               = "@markup.raw",

  --   -- HTML
  --   HTMLTag                    = "@punctuation",
  --   HTMLEndTag                 = "@punctuation",

  --   htmlTagN                   = "@type.definition",
  --   htmlSpecialTagName         = "htmlTagName",
  --   htmlBold                   = "Bold",

  --   javaScript                 = { fg = c.fg },
  }

  -- for i, color in ipairs(c.rainbow) do
  --   ret["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true }
  -- end
  return ret
end

return M
