---@diagnostic disable: undefined-doc-class, undefined-doc-name
---@class lig.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias lig.Highlights table<string,lig.Highlight|string>

---@alias lig.HighlightsFn fun(colors: ColorScheme, opts:lig.Config):lig.Highlights

---@class lig.Cache
---@field groups lig.Highlights
---@field inputs table
