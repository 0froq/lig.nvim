local Util = require("lig.util")

local M = {}

---@type lig.HighlightsFn
function M.get(c, opts)
  return {
    ColorColumn                = { bg = c.bg_alt },
    Conceal                    = { fg = c.fg_muted },
    CurSearch                  = { bg = Util.blend_bg(c.bg_search, 0.5), fg = c.fg_strong },
    Cursor                     = { fg = c.fg_reversed, bg = c.bg_reversed },
    lCursor                    = { fg = c.fg_reversed, bg = c.bg_reversed },
    CursorIM                   = { fg = c.fg_reversed, bg = c.bg_reversed },
    CursorLine                 = { bg = c.bg_alt },
    CursorColumn               = { bg = c.bg_alt },
    Directory                  = { fg = c.fg },
    DiffAdd                    = { fg = c.git.add },
    DiffChange                 = { fg = c.git.change },
    DiffDelete                 = { fg = c.git.delete },
    DiffText                   = { fg = Util.blend_bg(c.git.change, 0.3) },
    DiffTextAdd                = { fg = Util.blend_bg(c.git.add, 0.3) },
    EndOfBuffer                = { bg = c.bg },
    TermCursor                 = { fg = c.fg_reversed, bg = c.bg_reversed },
    OkMsg                      = { fg = c.msg.success },
    WarningMsg                 = { fg = c.msg.warning },
    ErrorMsg                   = { fg = c.msg.failure },
    StderrMsg                  = { fg = c.msg.failure },
    StdoutMsg                  = { fg = c.msg.success },
    WinSeparator               = { fg = c.divider },
    Folded                     = { bg = c.bg_folded },
    FoldColumn                 = { bg = c.bg_folded, fg = c.fg_muted },
    SignColumn                 = { bg = c.bg, fg = c.fg_muted },
    IncSearch                  = { bg = Util.blend_bg(c.bg_search, 0.4) },
    Substitute                 = { bg = c.bg_substitute, fg = c.fg_reversed },
    LineNr                     = { fg = c.fg_muted },
    LineNrAbove                = { fg = c.fg_muted },
    LineNrBelow                = { fg = c.fg_muted },
    CursorLineNr               = { fg = c.fg_strong, bold = true },
    CursorLineFold             = { fg = c.fg_strong, bold = true },
    CursorLineSign             = { fg = c.fg_strong, bold = true },
    MatchParen                 = { bg = c.bg, fg = c.fg_strong, bold = true },
    ModeMsg                    = { fg = c.fg_muted, bold = true },
    MsgArea                    = { fg = c.fg_muted },
    MsgSeparator               = { fg = c.divider },
    MoreMsg                    = { fg = c.msg.info },
    NonText                    = { fg = c.fg_muted },
    Normal                     = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NormalFloat                = { fg = c.fg, bg = c.bg_float },
    FloatBorder                = { fg = c.border, bg = c.bg_float, },
    FloatShadow                = { bg = c.shadow },
    FloatShadowThrough         = { bg = Util.blend_bg(c.shadow, 0.8) },
    FloatTitle                 = { fg = c.fg_strong, bg = c.bg_float, bold = true },
    FloatFooter                = { fg = c.fg_muted, bg = c.bg_float },
    NormalNC                   = { fg = c.fg_muted, bg = opts.transparent and c.none or (opts.dim_inactive and Util.blend_bg(c.bg, 0.9) or c.bg) },
    Pmenu                      = { bg = c.bg_float, fg = c.fg },
    PmenuSel                   = { bg = c.bg_selection },
    PmenuKind                  = { fg = c.fg_muted },
    PmenuKindSel               = { fg = c.fg_muted },
    PmenuExtra                 = { fg = c.fg_muted },
    PmenuExtraSel              = { fg = c.fg_muted },
    PmenuSbar                  = { bg = c.bg_alt },
    PmenuThumb                 = { bg = c.fg_strong },
    PmenuMatch                 = { fg = c.fg_strong, bold = true },
    PmenuMatchSel              = { fg = c.fg_strong, bold = true },
    PmenuBorder                = { fg = c.border, bg = c.bg_float },
    PmenuShadow                = { bg = c.shadow },
    PmenuShadowThrough         = { bg = Util.blend_bg(c.shadow, 0.8) },
    ComplMatchIns              = { fg = c.fg_strong, bold = true },
    PreInsert                  = { fg = c.fg, bold = true },
    ComplHint                  = { fg = c.fg_muted, bold = true },
    CompLHintMore              = { fg = c.fg_muted },
    Question                   = { fg = c.msg.warning, bold = true },
    QuickFixLine               = { fg = c.diag.error, bold = true },
    Search                     = { bg = Util.blend_bg(c.bg_search, 0.2) },
    SnippetTabstop             = { fg = c.accent1, bold = true },
    SnippetTabstopActive       = { fg = c.accent1, bold = true },
    SpecialKey                 = { fg = c.fg_muted },
    SpellBad                   = { undercurl = true, sp = c.diag.error },
    SpellCap                   = { undercurl = true, sp = c.diag.error },
    SpellLocal                 = { undercurl = true, sp = c.diag.error },
    SpellRare                  = { undercurl = true, sp = c.diag.error },
    StatusLine                 = { fg = c.fg_muted, bg = c.bg_statusline },
    StatusLineNC               = { fg = c.fg_muted, bg = c.bg_statusline },
    StatusLineTerm             = { fg = c.fg_muted, bg = c.bg_statusline },
    StatusLineTermNC           = { fg = c.fg_muted, bg = c.bg_statusline },
    TabLine                    = { fg = c.fg_muted, bg = c.bg_statusline },
    TabLineFill                = { fg = c.fg_muted, bg = c.bg },
    TabLineSel                 = { fg = c.fg_reversed, bg = c.bg_reversed, bold = true },
    Title                      = { fg = c.fg_strong, bold = true },
    Visual                     = { bg = c.bg_alt },
    VisualNOS                  = { bg = c.bg_alt },
    Whitespace                 = { fg = c.fg_dim },
    WildMenu                   = { bg = c.bg_selection, fg = c.fg },
    WinBar                     = { fg = c.fg_muted, bg = c.bg_statusline },
    WinBarNC                   = { fg = c.fg_muted, bg = c.bg_statusline },
    -- Menu                 = { bg = c.bg_float, fg = c.fg },
    -- Scrollbar            = { bg = c.bg_alt, fg = c.fg_muted },
    -- Tooltip              = { bg = c.bg_float, fg = c.fg },

    -- Structure
    Structure      = { fg = c.struct[2] },
    PreProc        = { fg = c.struct[2] },
    PreCondit      = { fg = c.struct[2] },
    Define         = { fg = c.struct[2] },
    Macro          = { fg = c.struct[2] },
    Tag            = { fg = c.struct[2] },

    -- Action
    Function       = { fg = c.action[2], style = opts.styles.functions },
    Exception      = { fg = c.action[2] },
    Debug          = { fg = c.action[2] },
    Method         = { fg = c.action[2] },

    -- Reference
    Special        = { fg = c.ref[1] },
    SpecialChar    = { fg = c.ref[1] },
    Typedef        = { fg = c.ref[1] },
    Include        = { fg = c.ref[2] },
    Constant       = { fg = c.ref[2] },
    Number         = { fg = c.ref[2] },
    Boolean        = { fg = c.ref[2] },
    Float          = { fg = c.ref[2] },
    Label          = { fg = c.ref[2] },
    Type           = { fg = c.ref[3] },

    -- Mono
    Character      = { fg = c.mono[1] },
    Variable       = { fg = c.mono[1] },
    Keyword        = { fg = c.mono[2], style = opts.styles.keywords },
    StorageClass   = { fg = c.mono[2] },
    Identifier     = { fg = c.mono[2], style = opts.styles.variables },
    Property       = { fg = c.mono[2] },
    Statement      = { fg = c.mono[2] },
    Conditional    = { fg = c.mono[2] },
    Repeat         = { fg = c.mono[2] },
    String         = { fg = c.mono[3] },
    Comment        = { fg = c.mono[3], style = opts.styles.comments },
    Operator       = { fg = c.mono[3] },
    Delimiter      = { fg = c.mono[3] },
    SpecialComment = { fg = c.mono[3], italic = true },

    Underlined                 = { underline = true },
    Bold                       = { bold = true, fg = c.fg_strong },
    Italic                     = { italic = true },

    Error                      = { fg = c.diag.error },

    Todo                       = { fg = c.fg_reversed, bg = c.comments.todo },

    --
    -- ------------------------------------------------------------------------
    -- -- 🧠 LSP / Diagnostics
    -- ------------------------------------------------------------------------
    DiagnosticError            = { fg = c.diag.error },
    DiagnosticWarn             = { fg = c.diag.warn },
    DiagnosticInfo             = { fg = c.diag.info },
    DiagnosticHint             = { fg = c.diag.hint },
    DiagnosticOk               = { fg = c.diag.ok },

    DiagnosticVirtualTextError = { bg = Util.blend_bg(c.diag.error, 0.2), fg = c.diag.error },
    DiagnosticVirtualTextWarn  = { bg = Util.blend_bg(c.diag.warn, 0.2), fg = c.diag.warn },
    DiagnosticVirtualTextInfo  = { bg = Util.blend_bg(c.diag.info, 0.2), fg = c.diag.info },
    DiagnosticVirtualTextHint  = { bg = Util.blend_bg(c.diag.hint, 0.2), fg = c.diag.hint },
    DiagnosticVirtualTextOk    = { bg = Util.blend_bg(c.diag.ok, 0.2), fg = c.diag.ok },

    DiagnosticUnderlineError   = { undercurl = true, sp = c.diag.error },
    DiagnosticUnderlineWarn    = { undercurl = true, sp = c.diag.warn },
    DiagnosticUnderlineInfo    = { undercurl = true, sp = c.diag.info },
    DiagnosticUnderlineHint    = { undercurl = true, sp = c.diag.hint },
    DiagnosticUnderlineOk      = { undercurl = true, sp = c.diag.ok },

    DiagnosticFloatingError    = { fg = c.diag.error },
    DiagnosticFloatingWarn     = { fg = c.diag.warn },
    DiagnosticFloatingInfo     = { fg = c.diag.info },
    DiagnosticFloatingHint     = { fg = c.diag.hint },
    DiagnosticFloatingOk       = { fg = c.diag.ok },

    DiagnosticSignError        = { fg = c.diag.error },
    DiagnosticSignWarn         = { fg = c.diag.warn },
    DiagnosticSignInfo         = { fg = c.diag.info },
    DiagnosticSignHint         = { fg = c.diag.hint },
    DiagnosticSignOk           = { fg = c.diag.ok },

    DiagnosticDeprecated       = { strikethrough = true },
    DiagnosticUnnecessary      = { fg = c.fg_dim },


    -- LSP highlight
    LspReferenceText            = { bg = c.bg_alt },
    LspReferenceRead            = { bg = c.bg_alt },
    LspReferenceWrite           = { bg = c.bg_alt },
    LspReferenceTarget          = "LspReferenceText",
    LspInlayHint                = { fg = c.fg_muted, bg = c.bg_alt },
    LspCodeLens                 = { fg = c.fg_muted },
    LspCodeLensSeparator        = "LspCodeLens",
    LspSignatureActiveParameter = { bg = c.bg_selection, bold = true },

    -- GitSignsAdd                 = { fg = c.git.add },    -- diff mode: Added line |diff.txt|
    -- GitSignsChange              = { fg = c.git.change }, -- diff mode: Changed line |diff.txt|
    -- GitSignsDelete              = { fg = c.git.delete }, -- diff mode: Deleted line |diff.txt|


    -- healthError                 = { fg = c.error },
    -- healthWarning               = { fg = c.warning },
    -- healthSuccess               = { fg = c.emerald },

    -- ------------------------------------------------------------------------
    -- -- 🧭 特殊场景
    -- ------------------------------------------------------------------------
    -- debugBreakpoint             = { bg = Util.blend_bg(c.info, 0.1), fg = c.info },
    -- debugPC                     = { bg = c.bg_secondary },
  }
end

return M
