let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/2_areas/development/themes/lig.nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +50 .lazy.lua
badd +14 lua/lig/groups/mini_files.lua
badd +11 lua/lig/groups/mini_clue.lua
badd +18 lua/lig/groups/noice.lua
badd +1 lua/lig/groups/mini_tabline.lua
badd +14 lua/lig/groups/telescope.lua
badd +68 lua/lig/groups/init.lua
badd +41 lua/lig/groups/base.lua
badd +44 lua/lig/groups/semantic_tokens.lua
badd +57 lua/lig/groups/blink.lua
badd +15 lua/lig/groups/mini_completion.lua
badd +87 ~/.config/nvim/lua/configs/blink.lua
badd +70 ~/2_areas/development/themes/lig.nvim/lua/lig/groups/treesitter.lua
badd +30 lua/lig/groups/kinds.lua
badd +17 ~/.config/nvim/lua/plugins/mini-completion.lua
badd +45 ~/2_areas/development/themes/lig.nvim/lua/lig/util.lua
badd +14 lua/lig/colors/dark.lua
badd +23 lua/lig/colors/light.lua
argglobal
%argdel
edit lua/lig/colors/light.lua
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt lua/lig/colors/dark.lua
setlocal foldmethod=expr
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
let s:l = 23 - ((22 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 23
normal! 013|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
