# LiG.nvim

A dark and light [Neovim](https://github.com/neovim/neovim) theme written in
[Lua](https://www.lua.org) forked from the [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) theme. 

## ✨ Features

- Supports the latest [Neovim](https://github.com/neovim/neovim)
  [0.9.0](https://github.com/neovim/neovim/releases/tag/v0.9.0) features.
- Terminal colors.
- Provides [lig](https://github.com/0froq/lig.nvim)
  [extras](#-extras) for numerous other applications.

<details>
<summary>🎨 Supported Plugins</summary>

<!-- plugins:start -->

| Plugin | Source |
| --- | --- |
| [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) | [`dashboard`](lua/lig/groups/dashboard.lua) |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | [`gitsigns`](lua/oq/groups/gitsigns.lua) |
| [mini.completion](https://github.com/nvim-mini/mini.completion) | [`mini_completion`](lua/oq/groups/mini_completion.lua) |
| [mini.diff](https://github.com/nvim-mini/mini.diff) | [`mini_diff`](lua/oq/groups/mini_diff.lua) |
| [mini.files](https://github.com/nvim-mini/mini.files) | [`mini_files`](lua/oq/groups/mini_files.lua) |
| [mini.indentscope](https://github.com/nvim-mini/mini.indentscope) | [`mini_indentscope`](lua/oq/groups/mini_indentscope.lua) |
| [mini.snippets](https://github.com/nvim-mini/mini.snippets) | [`mini_snippets`](lua/oq/groups/mini_snippets.lua) |
| [mini.statusline](https://github.com/nvim-mini/mini.statusline) | [`mini_statusline`](lua/oq/groups/mini_statusline.lua) |
| [mini.statusline](https://github.com/nvim-mini/mini.statusline) | [`mini_tabline`](lua/oq/groups/mini_tabline.lua) |
| [noice.nvim](https://github.com/folke/noice.nvim) | [`noice`](lua/oq/groups/noice.lua) |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | [`which-key`](lua/oq/groups/which-key.lua) |

<!-- plugins:end -->

</details>

<details>
<summary>🍭 Extras</summary>

<!-- extras:start -->

| Tool | Extra |
| --- | --- |
| [Ghostty](https://github.com/ghostty-org/ghostty) | [extras/ghostty](extras/ghostty) |
| [Kitty](https://sw.kovidgoyal.net/kitty/conf.html) | [extras/kitty](extras/kitty) |
| [Vim](https://vimhelp.org/) | [extras/vim](extras/vim) |
| [WezTerm](https://wezfurlong.org/wezterm/config/files.html) | [extras/wezterm](extras/wezterm) |

<!-- extras:end -->

</details>

## ⚡️ Requirements

- [Neovim](https://github.com/neovim/neovim) >=
  [0.8.0](https://github.com/neovim/neovim/releases/tag/v0.8.0)

## 📦 Installation

Install the theme with your preferred package manager, such as
[folke/lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "0froq/lig.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}
```

## 🚀 Usage

```lua
vim.cmd[[colorscheme lig]]
-- or specifically for one of the styles:
-- vim.cmd[[colorscheme lig-dark]] -- default
-- vim.cmd[[colorscheme lig-dark-soft]]
-- vim.cmd[[colorscheme lig-light]]
-- vim.cmd[[colorscheme lig-light-soft]]
```

Some plugins need extra configuration to work with **lig**.

<details>
  <summary>Click here for more details</summary>

### [Lualine](https://github.com/nvim-lualine/lualine.nvim)

```lua
-- Lua
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'lig'
    -- ... your lualine config
  }
}
```

</details>

## ⚙️ Configuration

> [!IMPORTANT]
> Set the configuration **BEFORE** loading the color scheme with `colorscheme lig`.

The theme offers four styles: **dark**, **dark-soft**, **light**,
and **light-soft**.

[lig](https://github.com/0froq/lig.nvim) uses the default options,
unless `setup` is explicitly called.

<details>
  <summary>Default Options</summary>

<!-- config:start -->

```lua
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
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
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
  ---@param highlights oq.Highlights
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
```

<!-- config:end -->

</details>

## 🪓 Overriding Colors & Highlight Groups

How the highlight groups are calculated:

1. `colors` are determined based on your configuration, with the ability to
   override them using `config.on_colors(colors)`.
1. These `colors` are utilized to generate the highlight groups.
1. `config.on_highlights(highlights, colors)` can be used to override highlight
   groups.

For default values of `colors` and `highlights`, please consult the
[dark](extras/lua/lig_dark.lua),
[dark-soft](extras/lua/lig_dark_soft.lua),
[light](extras/lua/lig_light.lua), and
[light-soft](extras/lua/lig_light_soft.lua) themes.

<details>
  <summary>Settings & Changing Colors</summary>

```lua
require("lig").setup({
  -- use the dark-soft style
  style = "dark-soft",
  -- disable italic for functions
  styles = {
    functions = {}
  },
  -- Change the "hint" comment color to the "coral" color, and make the "error" diagnostic color bright red
  on_colors = function(colors)
    colors.comment.hint = colors.coral
    colors.diag.error = "#ff0000"
  end
})
```

</details>

<details>
  <summary>Fix <code>undercurls</code> in Tmux</summary>

To have undercurls show up and in color, add the following to your
[Tmux](https://github.com/tmux/tmux) configuration file:

```sh
# Undercurl
set -g default-terminal "${TERM}"
set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
set -as terminal-overrides ',*:Setulc=\E[58::2::::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0
```

</details>

## 🍭 Extras

Extra color configs for [Kitty](https://sw.kovidgoyal.net/kitty/conf.html),
[WezTerm](https://wezfurlong.org/wezterm/config/files.html) and
[Ghostty](https://ghostty.org/) can be
found in [extras](extras/). To use them, refer to their respective
documentation.

You can easily use the color palette for other plugins inside your
[Neovim](https://github.com/neovim/neovim) configuration:

```lua
local colors = require("lig.colors").setup() -- pass in any of the config options as explained above
local util = require("lig.util")

aplugin.background = colors.bg_alt
aplugin.my_error = util.lighten(colors.amber, 0.3) -- number between 0 and 1. 0 results in white, 1 results in red1
```

## 🔥 Contributing

Pull requests are welcome.

For the [extras](#-extras), we use a simple template system that can be used to
generate themes for the different styles.

How to add a new extra template:

1. Create a file like `lua/lig/extra/cool-app.lua`.
2. Add the name and output file extension to the `extras` table in
   `lua/lig/extra/init.lua`.
3. Run the following command to generate new [extra](#-extras) themes from the lig plugin directory:

   ```sh
   ./scripts/build
   ```

4. Check the newly created themes in the `extra/` directory. Please **DO NOT**
   commit them, as they are already automatically built by the CI.
