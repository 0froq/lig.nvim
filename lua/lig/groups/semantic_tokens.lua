local Util = require("lig.util")

local M = {}

---@type lig.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    ["@lsp"] = {},
    -- Without a `mod` specified, they should be `call` / `reference`
    ["@lsp.type.namespace"] = "@module",
    ["@lsp.type.class"] = "@type",
    ["@lsp.type.enum"] = "@constant",
    ["@lsp.type.interface"] = "@type",
    ["@lsp.type.struct"] = "@type",
    ["@lsp.type.typeParameter"] = "@type",
    ["@lsp.type.type"] = "@type",

    ["@lsp.type.parameter"] = "@variable",
    ["@lsp.type.variable"] = "@variable",
    ["@lsp.type.property"] = "@property",
    ["@lsp.type.enumMember"] = "@constant",

    ["@lsp.type.decorator"] = "@attribute",
    ["@lsp.type.event"] = "@function",

    ["@lsp.type.function"] = "@function.call",
    ["@lsp.type.method"] = "@function.method.call",
    ["@lsp.type.macro"] = "@function.macro",

    ["@lsp.type.label"] = "@label",

    ["@lsp.type.comment"] = "@comment",
    ["@lsp.type.string"] = "@string",
    ["@lsp.type.keyword"] = "@keyword",
    ["@lsp.type.number"] = "@number",
    ["@lsp.type.regexp"] = "@string.regexp",
    ["@lsp.type.operator"] = "@operator",
    ["@lsp.type.boolean"] = "@boolean",

    -- Mending
    ["@lsp.type.component"] = "@constant",
    ["@lsp.type.unresolvedReference"] = { undercurl = true, sp = c.diag.error },

    -- Declaration / Definition
    ["@lsp.typemod.namespace.declaration"] = "@module.builtin",
    ["@lsp.typemod.namespace.definition"] = "@module.builtin",
    ["@lsp.typemod.class.declaration"] = "@type.definition",
    ["@lsp.typemod.class.definition"] = "@type.definition",
    ["@lsp.typemod.enum.declaration"] = "@type.definition",
    ["@lsp.typemod.enum.definition"] = "@type.definition",
    ["@lsp.typemod.interface.declaration"] = "@type.definition",
    ["@lsp.typemod.interface.definition"] = "@type.definition",
    ["@lsp.typemod.struct.declaration"] = "@type.definition",
    ["@lsp.typemod.struct.definition"] = "@type.definition",
    ["@lsp.typemod.type.declaration"] = "@type.definition",
    ["@lsp.typemod.type.definition"] = "@type.definition",
    ["@lsp.typemod.typeParameter.declaration"] = "@type.definition",
    ["@lsp.typemod.typeParameter.definition"] = "@type.definition",
    ["@lsp.typemod.parameter.declaration"] = "@variable.parameter",
    ["@lsp.typemod.parameter.definition"] = "@variable.parameter",
    ["@lsp.typemod.property.declaration"] = "@variable.parameter",
    ["@lsp.typemod.property.definition"] = "@variable.parameter",
    ["@lsp.typemod.enumMember.declaration"] = "@constant.builtin",
    ["@lsp.typemod.enumMember.definition"] = "@constant.builtin",
    ["@lsp.typemod.event.declaration"] = "@function",
    ["@lsp.typemod.event.definition"] = "@function",
    ["@lsp.typemod.function.declaration"] = "@function",
    ["@lsp.typemod.function.definition"] = "@function",
    ["@lsp.typemod.method.declaration"] = "@function.method",
    ["@lsp.typemod.method.definition"] = "@function.method",

    ["@lsp.typemod.keyword.documentation"] = "@keyword.modifier",

    ["@lsp.mod.static"]        = "@keyword.modifier",
    ["@lsp.mod.deprecated"]    = "DiagnosticDeprecated",
    ["@lsp.mod.abstract"]      = "@type",
    ["@lsp.mod.async"]         = "@keyword.coroutine",
    ["@lsp.mod.modification"]  = "@keyword.return",    -- 仅用作样式链接，不新开色
    ["@lsp.mod.documentation"] = "@comment.documentation",
    ["@lsp.mod.defaultLibrary"] = { italic = true },
  }
end

return M
