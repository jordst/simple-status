let g:simple_status_loaded = 1

let g:currentmode={
	  \ 'n'  : 'n',
	  \ 'v'  : 'v',
	  \ 'V'  : 'vl',
	  \ "\<C-v>" : 'vb',
	  \ 'i'  : 'i',
	  \ 'R'  : 'r',
	  \ 'Rv' : 'rv',
	  \ 'c'  : 'c',
	  \ 't'  : 'f',
	  \}

if !exists("g:normal_color")
	let g:normal_color = "White"
	let g:normal_colorfg = "Black"
	let g:normal_ctermbg = "231" " White
	let g:normal_ctermfg = "16" " Black
	let g:statuslineNC_color = "Black"
	let g:statuslineNCbg = "White"
	let g:statusline_color = "Violet"
	let g:statusline_background = "Black"
	let g:statusline_ctermbg = "16" " black
	let g:statusline_ctermfg = "177" " violet
	let g:statuslineNC_ctermfg = "231" " white
	let g:statuslineNC_ctermbg = "16" " black
endif

function! Return_Time()
	return strftime("%H:%M")
endfunction

function Set_statusline(timer)
set laststatus=2
set statusline=
set statusline+=%#NormalColor#%{(g:currentmode[mode()]=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#InsertColor#%{(g:currentmode[mode()]=='i')?'\ \ INSERT\ ':''}
set statusline+=%#ReplaceColor#%{(g:currentmode[mode()]=='r')?'\ \ REPLACE\ ':''}
set statusline+=%#VisualColor#%{(g:currentmode[mode()]=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#VisualColor#%{(g:currentmode[mode()]=='vl')?'\ \ V-LINE\ ':''}
set statusline+=%#VisualColor#%{(g:currentmode[mode()]=='vb')?'\ \ V-BLOCK\ ':''}
set statusline+=%#CommandColor#%{(g:currentmode[mode()]=='c')?'\ \ COMMAND\ ':''}
set statusline+=%#JobColor#%{(g:currentmode[mode()]=='f')?'\ \ TERM\ JOB\ ':''}
set statusline+=%1*\ %<%F\  " filename
set statusline+=%7*\[%n] " buffnr
set statusline+=%2*\ %=%y " FileType
set statusline+=%4*\ %{&ff}\ \│ " FileFormat (dos/unix..)
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).'\ \│'} " Encoding utf-8
set statusline+=%9*\ (%3l/%3L)%3c\ │ " (Line:Lines): ColNr
set statusline+=%8*\ %{%Return_Time()%}\  " Return current time
set statusline+=%0*\ \ %m%r%w\ %P\ \ \  " Mod/RO/TOP?

hi VisualColor guibg=Orange guifg=Black gui=BOLD ctermbg=214 ctermfg=16 cterm=BOLD
hi InsertColor guibg=Green guifg=Black gui=BOLD ctermbg=46 ctermfg=16 cterm=BOLD
hi ReplaceColor guibg=Yellow guifg=Black gui=BOLD ctermbg=226 ctermfg=16 cterm=BOLD
hi CommandColor guibg=Cyan guifg=Black gui=BOLD ctermbg=51 ctermfg=16 cterm=BOLD
hi JobColor guibg=violet guifg=Black gui=BOLD ctermbg=231 ctermfg=16 cterm=BOLD

exe 'hi NormalColor guibg='.g:normal_color.' guifg='.g:normal_colorfg.' gui=BOLD ctermbg='.g:normal_ctermbg.' ctermfg='.g:normal_ctermfg.' cterm=BOLD'
exe 'hi statusline guifg='.g:statusline_color.' guibg='.g:statusline_background.' ctermfg='.g:statusline_ctermfg.' ctermbg='.g:statusline_ctermbg
exe 'hi statuslinenc guifg='.g:statuslineNC_color.' guibg='.g:statuslineNCbg.' ctermfg='.g:statuslineNC_ctermfg.' ctermbg='.g:statuslineNC_ctermbg
endfunction

call Set_statusline(v:true)
call timer_start(60000, 'Set_statusline', {'repeat': -1})
