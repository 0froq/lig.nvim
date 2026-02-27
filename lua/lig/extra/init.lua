---@diagnostic disable: undefined-global
local Util = require("lig.util")

local M = {}

-- map of plugin name to plugin extension
--- @type table<string, {ext:string, url:string, label:string, subdir?: string, sep?:string}>
-- stylua: ignore
M.extras = {
  ghostty = { ext = "", url = "https://github.com/ghostty-org/ghostty", label = "Ghostty" },
  kitty   = { ext = "conf", url = "https://sw.kovidgoyal.net/kitty/conf.html", label = "Kitty" },
  wezterm = { ext = "toml", url = "https://wezfurlong.org/wezterm/config/files.html", label = "WezTerm" },
  vim     = { ext = "vim", url = "https://vimhelp.org/", label = "Vim", subdir = "colors", sep = "-" },
}

function M.setup()
  local lig = require("lig")
  vim.o.background = "dark"

  -- map of style to style name
  local styles = {
    dark = " Dark",
    ["dark-soft"] = " Dark Soft",
    light = " Light",
    ["light-soft"] = " Light Soft",
  }

  ---@type string[]
  local names = vim.tbl_keys(M.extras)
  table.sort(names)

  -- tokyonight.setup({ plugins = { all = true } })
  for _, extra in ipairs(names) do
    local info = M.extras[extra]
    local plugin = require("lig.extra." .. extra)
    for style, style_name in pairs(styles) do
      local colors, groups, opts = lig.load({ style = style, plugins = { all = true } })
      local fname = extra
          .. (info.subdir and "/" .. info.subdir .. "/" or "")
          .. "/lig"
          .. (info.sep or "_")
          .. style
          .. "."
          .. info.ext
      fname = string.gsub(fname, "%.$", "") -- remove trailing dot when no extension
      colors["_upstream_url"] = "https://github.com/0froq/lig.nvim/raw/main/extras/" .. fname
      colors["_style_name"] = "LiG" .. style_name
      colors["_name"] = "lig_" .. style
      colors["_style"] = style
      print("[write] " .. fname)
      Util.write("extras/" .. fname, plugin.generate(colors, groups, opts))
    end
  end
end

return M
