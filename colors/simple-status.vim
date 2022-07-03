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
set statusline+=%1*\ %<%t\ 									"filename
set statusline+=%7*\[%n]\ 									"buffnr
set statusline+=%2*\ %=%y									"FileType
set statusline+=%4*\ %{&ff}\ \|                             "FileFormat (dos/unix..) 
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).'\ \|'}    "Encoding
set statusline+=%9*\ %3l\:%3c\ \|							"LineNr:ColNr
set statusline+=%0*\ \ %m%r%w\ %P\ \ 				 		"Mod/RO/TOP?
"set statusline+=%8*\ (%3p%%)\ \|                           "Totat Percent
"set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\				"Encoding2
"set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\	"Spellanguage & Highlight on?
if &background == "dark"
	hi NormalColor guibg=White guifg=Black gui=BOLD ctermbg=231 ctermfg=16 cterm=BOLD
	hi VisualColor guibg=Orange guifg=Black gui=BOLD ctermbg=214 ctermfg=16 cterm=BOLD
	hi InsertColor guibg=Green guifg=Black gui=BOLD ctermbg=46 ctermfg=16 cterm=BOLD
	hi ReplaceColor guibg=Yellow guifg=Black gui=BOLD ctermbg=226 ctermfg=16 cterm=BOLD
	hi CommandColor guibg=Cyan guifg=Black gui=BOLD ctermbg=51 ctermfg=16 cterm=BOLD
	hi JobColor guibg=violet guifg=Black gui=BOLD ctermbg=231 ctermfg=16 cterm=BOLD
	hi statusline guifg=violet
	hi statuslinenc guifg=White
else
	hi NormalColor guibg=#b4eeb4 guifg=Black gui=BOLD ctermbg=157 ctermfg=16 cterm=BOLD
	hi VisualColor guibg=Orange guifg=Black gui=BOLD ctermbg=214 ctermfg=16 cterm=BOLD
	hi InsertColor guibg=Green guifg=Black gui=BOLD ctermbg=46 ctermfg=16 cterm=BOLD
	hi ReplaceColor guibg=Yellow guifg=Black gui=BOLD ctermbg=226 ctermfg=16 cterm=BOLD
	hi CommandColor guibg=Cyan guifg=Black gui=BOLD ctermbg=51 ctermfg=16 cterm=BOLD
	hi JobColor guibg=violet guifg=Black gui=BOLD ctermbg=231 ctermfg=16 cterm=BOLD
	hi statusline guifg=green guibg=black
	hi statuslinenc guifg=#f0fff0 guibg=black ctermbg=194
endif
