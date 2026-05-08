---@diagnostic disable: undefined-global
local Util = require("lig.util")

local M = {}

---@type table<string, Theme|fun(opts:lig.Config):Theme>
M.styles = setmetatable({}, {
  __index = function(_, style)
    return vim.deepcopy(Util.mod("lig.colors." .. style))
  end,
})

---@param opts? lig.Config
function M.setup(opts)
  opts = require("lig.config").extend(opts)
  local mono = opts.mono.enabled or false
  local keep = opts.mono.keep or {}

  Util.mono = mono
  Util.day_brightness = opts.day_brightness

  local palette = M.styles[opts.style]
  if type(palette) == "function" then
    palette = palette(opts) --[[@as Theme]]
  end

  -- Color Palette
  ---@class ColorScheme: Theme
  local colors         = palette

  Util.bg              = colors.bg
  Util.fg              = colors.fg

  colors.bg_selection  = Util.blend_fg(colors.bg_alt, 0.95)

  colors.bg_folded     = Util.blend_fg(colors.bg_alt, 0.8)
  colors.bg_search     = colors.yellow[2]
  colors.bg_substitute = colors.red[2]
  colors.bg_statusline = Util.blend_fg(colors.bg, 0.9)


  colors.fg_sidebar   = colors.fg_muted
  colors.border       = colors.fg_muted
  colors.divider      = colors.fg_muted
  colors.shadow       = colors.fg_dim

  colors.mode         = {
    normal = colors.green[2],
    insert = colors.bg_reversed,
    visual = colors.magenta[2],
    replace = colors.yellow[2],
    command = colors.blue[2],
    other = colors.bg_highlight
  }

  colors.git          = {
    add = colors.green[2],
    delete = colors.red[2],
    change = colors.yellow[2],
    ignore = colors.fg_muted
  }

  colors.diag         = {
    error = colors.red[2],
    warn  = colors.yellow[2],
    info  = colors.cyan[2],
    hint  = colors.green[2],
    ok    = colors.blue[2]
  }

  colors.msg          = {
    success = colors.green[2],
    failure = colors.red[2],
    warning = colors.yellow[2],
    info    = colors.cyan[2],
  }

  colors.comments     = {
    error   = colors.red[2],
    todo    = colors.blue[2],
    warning = colors.yellow[2],
    info    = colors.cyan[2],
    note    = colors.green[2],
    hint    = colors.cyan[2],
  }

  colors.rainbow      = {
    colors.orange[2],
    colors.cyan[2],
    colors.red[2],
    colors.blue[2],
    colors.yellow[2],
    colors.green[2],
    colors.magenta[2],
  }

  colors.struct       = colors.green
  colors.ref          = colors.blue
  colors.action       = colors.orange
  colors.member       = colors.cyan
  colors.mono         = {
    colors.fg_strong,
    colors.fg,
    colors.fg_muted,
  }

  -- stylua: ignore
  ---@class TerminalColors
  colors.terminal     = {
    black          = colors.bg,
    black_bright   = Util.blend_fg(colors.bg, 0.9),
    red            = colors.red[2],
    red_bright     = colors.red[3],
    green          = colors.green[2],
    green_bright   = colors.green[3],
    yellow         = colors.yellow[2],
    yellow_bright  = colors.yellow[3],
    blue           = colors.blue[2],
    blue_bright    = colors.blue[3],
    magenta        = colors.magenta[2],
    magenta_bright = colors.magenta[3],
    cyan           = colors.cyan[2],
    cyan_bright    = colors.cyan[3],
    white          = colors.fg,
    white_bright   = colors.fg_strong,
  }

  local syntax_tokens = {
    identifier     = colors.fg,
    variable       = colors.fg,
    property       = colors.fg,
    parameter      = colors.fg,
    label          = colors.fg,
    operator       = colors.fg_muted,
    delimiter      = colors.fg_muted,
    keyword        = colors.fg,
    string         = colors.fg_muted,
    character      = colors.fg_muted,
    comment        = colors.fg_muted,
    specialComment = colors.fg_muted,

    type           = colors.struct[2],
    typeDef        = colors.struct[2],
    structure      = colors.struct[2],
    storageClass   = colors.struct[2],
    tag            = colors.struct[2],

    constant       = colors.ref[2],
    number         = colors.ref[2],
    boolean        = colors.ref[2],
    float          = colors.ref[2],

    func           = colors.action[2],
    method         = colors.action[2],
    statement      = colors.action[2],
    exception      = colors.action[2],
    debug          = colors.action[2],
    macro          = colors.action[2],

    special        = colors.red[2],
    specialChar    = colors.red[2],
  }


  local mono_syntax_tokens = {
    comment        = colors.fg_dim,
    constant       = colors.fg,
    string         = colors.fg_muted,
    character      = colors.fg,
    number         = colors.fg,
    boolean        = colors.fg,
    float          = colors.fg,
    identifier     = colors.fg,
    func           = colors.fg,
    statement      = colors.fg,
    conditional    = colors.fg,
    rep            = colors.fg,
    label          = colors.fg,
    operator       = colors.fg_muted,
    keyword        = colors.fg,
    exception      = colors.fg,
    preProc        = colors.fg,
    include        = colors.fg,
    define         = colors.fg,
    macro          = colors.fg,
    preCondit      = colors.fg,
    type           = colors.fg,
    storageClass   = colors.fg,
    structure      = colors.fg,
    typeDef        = colors.fg,
    special        = colors.fg,
    specialChar    = colors.fg,
    tag            = colors.fg,
    delimiter      = colors.fg_muted,
    specialComment = colors.fg_muted,
    debug          = colors.fg,

    variable       = colors.fg,
    property       = colors.fg,
    method         = colors.fg,
    parameter      = colors.fg
  }

  for token, col in pairs(mono and mono_syntax_tokens or syntax_tokens) do
    if keep[token] == true then
      colors[token] = syntax_tokens[token]
    else
      colors[token] = col
    end
  end

  colors.accent1 = colors.green[2]
  colors.accent2 = colors.orange[2]

  colors.none    = "NONE"

  opts.on_colors(colors)

  return colors, opts
end

return M
