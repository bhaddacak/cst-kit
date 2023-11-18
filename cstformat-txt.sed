/<body>/,/<\/body>/{
s_<p rend="bodytext">\(.\+\)</p>_\1_g
s_<p rend="bodytext" n="(\?[0-9:-]\+)\?">\(.\+\)</p>_\1_g
s_<p rend="hangnum" n="(\?[0-9:-]\+)\?">\(.\+\)</p>_\1_g
s_<p rend="hangnum">\(.\+\)</p>_\1_g
}
