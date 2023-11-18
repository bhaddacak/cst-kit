/<body>/,/<\/body>/{
s_<p rend="bodytext">\(.\+\)</p>_<p>\1</p>_g
s_<p rend="bodytext" n="(\?[0-9:-]\+)\?">\(.\+\)</p>_<p>\1</p>_g
s_<p rend="hangnum" n="(\?[0-9:-]\+)\?">\(.\+\)</p>_<p>\1</p>_g
s_<p rend="hangnum">\(.\+\)</p>_<p>\1</p>_g
}
