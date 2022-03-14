let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Projects/linkedout-profile-checker
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd .
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
if bufexists("term://~/Projects/linkedout-profile-checker//1254539:/bin/zsh;\#toggleterm\#6") | buffer term://~/Projects/linkedout-profile-checker//1254539:/bin/zsh;\#toggleterm\#6 | else | edit term://~/Projects/linkedout-profile-checker//1254539:/bin/zsh;\#toggleterm\#6 | endif
if &buftype ==# 'terminal'
  silent file term://~/Projects/linkedout-profile-checker//1254539:/bin/zsh;\#toggleterm\#6
endif
balt ~/Projects/linkedout-profile-checker/linkedout/pages/index.tsx
let s:l = 29 - ((28 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 29
normal! 011|
tabnext 1
badd +1 ~/Projects/linkedout-profile-checker/linkedout/pages/_app.tsx
badd +13 ~/Projects/linkedout-profile-checker/linkedout/pages/api/hello.ts
badd +15 ~/Projects/linkedout-profile-checker/linkedout/pages/index.tsx
badd +4 ~/Projects/linkedout-profile-checker/linkedout/package.json
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOF
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
