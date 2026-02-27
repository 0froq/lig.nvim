---@diagnostic disable: undefined-global
local M = {}

M.version = "0.0.1" -- x-release-please-version

---@class lig.Config
---@field on_colors fun(colors: ColorScheme)
---@field on_highlights fun(highlights: lig.Highlights, colors: ColorScheme)
M.defaults = {
  style = "dark",
  light_style = "light",  -- The theme is used when the background is set to light
  mono = {
    enabled = false,
  },           -- Use a monochromatic color scheme, disabling most syntax highlighting
  transparent = false,    -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    -- comments = { italic = true },
    -- keywords = { italic = true },
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark",  -- style for sidebars, see below
    floats = "dark",    -- style for floating windows
  },
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Light** style. Number between 0 and 1, from dull to vibrant colors
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights lig.Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,

  cache = false, -- When set to true, the theme will be cached for better performance

  ---@type table<string, boolean|{enabled:boolean}>
  plugins = {
    -- enable all plugins when not using lazy.nvim
    -- set to false to manually enable/disable plugins
    all = package.loaded.lazy == nil,
    -- uses your plugin manager to automatically enable needed plugins
    -- currently only lazy.nvim is supported
    auto = true,
    -- add any plugins here that you want to enable
    -- for all possible plugins, see:
    --   * https://github.com/0froq/lig.nvim/tree/main/lua/lig/groups
    -- telescope = true,
  },
}

---@type lig.Config
M.options = nil

---@param options? lig.Config
function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

---@param opts? lig.Config
function M.extend(opts)
  return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or M.options
end

setmetatable(M, {
  __index = function(_, k)
    if k == "options" then
      return M.defaults
    end
  end,
})

return M
