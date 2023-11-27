/<body>/,/<\/body>/{
s_<pb ed="." n=".\.[0-9]\+" />__g
s_<note>\([^<]\+\)</note>_ [\1] _g
s_<hi rend="bold">\([^<]\+\)</hi>_\1_g
s_<hi rend="bold"></hi>__g
s_</b><b>__g
s_<hi rend="paranum">\((\?[0-9:-]\+)\?\)</hi>_\1_g
s_<hi rend="dot">.</hi>_. _g
s_<p rend="\(nikaya\|book\)">\(.\+\)</p>_\2_g
s_<p rend="chapter">\(.\+\)</p>_\1_g
s_<p rend="title">\(.\+\)</p>_\1_g
s_<p rend="subhead">\(.\+\)</p>_\1_g
s_<p rend="subsubhead">\(.\+\)</p>_\1_g
s_<p rend="\(end\)\?part">\(.\+\)</p>_\2_g
s_<p rend="\(end\)\?group">\(.\+\)</p>_\2_g
s_<p rend="\(end\)\?subgroup">\(.\+\)</p>_\2_g
s_<p rend="strong">\(.\+\)</p>_\1_g
s_<p rend="centre">\(.\+\)</p>_\1_g
s_<p rend="unindented">\(.\+\)</p>_\1_g
s_<p rend="indent">\(.\+\)</p>_\1_g
s_<p rend="gatha1">\(.\+\)</p>_\1_g
s_<p rend="gatha1" n=".\+">\(.\+\)</p>_\1_g
s_<p rend="gatha2">\(.\+\)</p>_\1_g
s_<p rend="gatha3">\(.\+\)</p>_\1_g
s_<p rend="gathalast">\(.\+\)</p>_\1_g
}


