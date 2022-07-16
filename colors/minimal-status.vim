set statusline=[%{%mode()%}]\ %F\ [%n]\ 
set statusline+=%=\ %y\ %{&ff}\ \│\ (%3l:%3L)\ %3c\ \│\ %{%strftime('%H:%M')%}\ \│\ %m%w%r%P\ 
call timer_start(60000, {-> execute(':let &stl=&stl')}, {'repeat': -1})
