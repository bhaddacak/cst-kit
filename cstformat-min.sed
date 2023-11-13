/<body>/,/<\/body>/{
s_<p rend="[^"]\+"></p>__g
s_‘‘_“_g
s_’’_”_g
s_”’_’”_g
s_‘ \+_‘_g
s_“ \+_“_g
s_ \+’_’_g
s_ \+”_”_g
s_ \+_ _g
s_ ;_;_g
s_ ,_,_g
s_ \._._g
s_ ?_?_g
s_ !_!_g
s_^ \+__g
s_ \+$__g
s_\([‘’“”]\+\)nti_n\1ti_g
s_</b>nti_n</b>ti_g
s_\([‘’“”]\+\)n<_n\1<_g
s_\r__g
s_\n\n_\n_g
}

