---@diagnostic disable: undefined-doc-class, undefined-doc-name
---@class lig.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias lig.Highlights table<string,lig.Highlight|string>

---@alias lig.HighlightsFn fun(colors: ColorScheme, opts:lig.Config):lig.Highlights

---@class lig.Cache
---@field groups lig.Highlights
---@field inputs table

---@alias ColorTriad [string, string, string]

---@class GrayScale
---@field black string
---@field white string
---@field soft_50 string
---@field soft_100 string
---@field soft_200 string
---@field soft_300 string
---@field soft_400 string
---@field soft_500 string
---@field soft_600 string
---@field soft_700 string
---@field soft_800 string
---@field soft_900 string
---@field soft_950 string

---@class Colors
---@field red ColorTriad
---@field green ColorTriad
---@field yellow ColorTriad
---@field blue ColorTriad
---@field magenta ColorTriad
---@field cyan ColorTriad
---@field orange ColorTriad
---@field azure ColorTriad

---@class Palette: GrayScale, Colors

---@class Theme: Palette
---@field bg string
---@field bg_alt string
---@field bg_float string
---@field bg_reversed string
---@field bg_highlight string
---@field fg string
---@field fg_muted string
---@field fg_dim string
---@field fg_reversed string
---@field fg_strong string

---@class TerminalColors
---@field black string
---@field black_bright string
---@field red string
---@field red_bright string
---@field green string
---@field green_bright string
---@field yellow string
---@field yellow_bright string
---@field blue string
---@field blue_bright string
---@field magenta string
---@field magenta_bright string
---@field cyan string
---@field cyan_bright string
---@field white string
---@field white_bright string

---@class ColorScheme: Theme
---@field bg_selection string
---@field bg_folded string
---@field bg_search string
---@field bg_substitute string
---@field bg_statusline string
---@field fg_sidebar string
---@field border string
---@field divider string
---@field shadow string
---@field mode table<string, string>
---@field git { add: string, delete: string, change: string, ignore: string }
---@field diag { error: string, warn: string, info: string, hint: string, ok: string }
---@field msg { success: string, failure: string, warning: string, info: string }
---@field comments { error: string, todo: string, warning: string, info: string, note: string, hint: string }
---@field rainbow string[]
---@field struct ColorTriad
---@field ref ColorTriad
---@field action ColorTriad
---@field member ColorTriad
---@field mono ColorTriad
---@field terminal TerminalColors
---@field accent1 string
---@field accent2 string
---@field none string
---@field [string] any

---@alias Colorscheme ColorScheme
