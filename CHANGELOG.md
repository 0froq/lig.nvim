# Changelog

## 0.2.1 - 2026-10-12

- Use the mono muted tier for strings in all four variants instead of the secondary foreground, making their gray reading level distinct from base ink.
- Preserve existing gray ramps, operator/UI secondary ink and retired soft compatibility entrypoints.

## 0.2.0 - 2026-10-11

- Migrate the official repository to the canonical LiG OKLCH compiler and current token palette.
- Add Light Paper and Dark Paper; retain old soft entrypoints as paper redirects.
- Retain all sixteen implemented integrations, Tree-sitter/LSP/classic syntax, terminal colors and lualine/lightline.
- Keep the stable lig Lua API and colorscheme identity; introduce on_tokens in place of on_colors, retire the mono profile and old palette internals.
- Replace duplicate palette/extras generation with an immutable canonical source manifest, checksum verification and native API CI on Neovim 0.10.4 and 0.12.4.
- See README.md for breaking option changes and preview migration instructions.

## 0.1.2 - 2026-06-06

- Extract theme colors into a reusable source/template layer.
- Keep existing Neovim highlight output stable across dark, dark-soft, light, and light-soft styles.
- Add theme-template documentation and explicit color scheme type definitions.

## 0.0.1 - Initial release
