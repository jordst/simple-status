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

if exists("g:normal_color") == 0
	let normal_color = "White"
	let normal_ctermbg = "231" " White
	let statuslineNC_color = "gray20"
	let statusline_color = "Violet"
	let statusline_background = "Black"
	let statusline_ctermbg = "16" " black
	let statusline_ctermfg = "177" " violet
	let statuslineNC_ctermfg = "231" " white
	let statuslineNC_ctermbg = "16" " black
endif

set laststatus=2
set statusline=
set statusline+=%#NormalColor#%{(g:currentmode[mode()]=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#InsertColor#%{(g:currentmode[mode()]=='i')?'\ \ INSERT\ ':''}
set statusline+=%#ReplaceColor#%{(g:currentmode[mode()]=='r')?'\ \ REPLACE\ ':''}
set statusline+=%#VisualColor#%{(g:currentmode[mode()]=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#VisualColor#%{(g:currentmode[mode()]=='vl')?'\ \ V-LINE\ ':''}
set statusline+=%#VisualColor#%{(g:currentmode[mode()]=='vb')?'\ \ V-BLOCK\ ':''}
set statusline+=%#CommandColor#%{(g:currentmode[mode()]=='c')?'\ \ COMMAND\ ':''}
set statusline+=%#JobColor#%{(g:currentmode[mode()]=='f')?'\ \ Term-Job\ ':''}
set statusline+=%1*\ %<%t\ 											" filename
set statusline+=%7*\[%n]\ 												" buffnr
set statusline+=%2*\ %=%y												" FileType
set statusline+=%4*\ %{&ff}\ \|                             " FileFormat (dos/unix..) 
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).'\ \|'}    " Encoding
set statusline+=%9*\ %3l\:%3c\ \|									" LineNr:ColNr
set statusline+=%0*\ \ %m%r%w\ %P\ \ 								" Mod/RO/TOP?
"set statusline+=%8*\ (%3p%%)\ \|                           " Totat Percent
"set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\					" Encoding2
"set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\	" Spellanguage & Highlight on?

exe 'hi NormalColor guibg='.normal_color.' guifg=Black gui=BOLD ctermbg='.normal_ctermbg.' ctermfg=16 cterm=BOLD'
hi VisualColor guibg=Orange guifg=Black gui=BOLD ctermbg=214 ctermfg=16 cterm=BOLD
hi InsertColor guibg=Green guifg=Black gui=BOLD ctermbg=46 ctermfg=16 cterm=BOLD
hi ReplaceColor guibg=Yellow guifg=Black gui=BOLD ctermbg=226 ctermfg=16 cterm=BOLD
hi CommandColor guibg=Cyan guifg=Black gui=BOLD ctermbg=51 ctermfg=16 cterm=BOLD
hi JobColor guibg=violet guifg=Black gui=BOLD ctermbg=231 ctermfg=16 cterm=BOLD
exe 'hi statusline guifg='.statusline_color.' guibg='.statusline_background.' ctermfg='.statusline_ctermfg.' ctermbg='.statusline_ctermbg
exe 'hi statuslinenc guifg='.statuslineNC_color.' guibg=black ctermfg='.statuslineNC_ctermfg.' ctermbg='.statuslineNC_ctermbg
