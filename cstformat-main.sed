/<body>/,/<\/body>/{
s_<pb ed="." n=".\.[0-9]\+" />__g
s_<note>\([^<]\+\)</note>_ [\1] _g
s_<hi rend="bold"></hi>__g
s_<hi rend="bold">\([^<]\+\)</hi>_<b>\1</b>_g
s_</b><b>__g
s_<hi rend="paranum">\((\?[0-9:-]\+)\?\)</hi>_\1_g
s_<hi rend="dot">.</hi>_. _g
s_<p rend="\(nikaya\|book\)">\(.\+\)</p>_<h2>\2</h2>_g
s_<p rend="chapter">\(.\+\)</p>_<h3>\1</h3>_g
s_<p rend="title">\(.\+\)</p>_<h4>\1</h4>_g
s_<p rend="subhead">\(.\+\)</p>_<h5>\1</h5>_g
s_<p rend="subsubhead">\(.\+\)</p>_<h6>\1</h6>_g
s_<p rend="part">\(.\+\)</p>_<div class="part"><strong>\1</strong></div>_g
s_<p rend="group">\(.\+\)</p>_<div class="group"><strong>\1</strong></div>_g
s_<p rend="subgroup">\(.\+\)</p>_<div class="subgroup"><strong>\1</strong></div>_g
s_<p rend="endpart">\(.\+\)</p>_<div class="endpart">\1</div>_g
s_<p rend="endgroup">\(.\+\)</p>_<div class="endgroup">\1</div>_g
s_<p rend="endsubgroup">\(.\+\)</p>_<div class="endsubgroup">\1</div>_g
s_<p rend="strong">\(.\+\)</p>_<div class="strong"><strong>\1</strong></div>_g
s_<p rend="centre">\(.\+\)</p>_<div class="centre">\1</div>_g
s_<p rend="unindented">\(.\+\)</p>_<div class="unindented">\1</div>_g
s_<p rend="indent">\(.\+\)</p>_<div class="indent">\1</div>_g
s_<p rend="gatha1">\(.\+\)</p>_<div class="gatha1">\1</div>_g
s_<p rend="gatha1" n=".\+">\(.\+\)</p>_<div class="gatha1">\1</div>_g
s_<p rend="gatha2">\(.\+\)</p>_<div class="gatha2">\1</div>_g
s_<p rend="gatha3">\(.\+\)</p>_<div class="gatha3">\1</div>_g
s_<p rend="gathalast">\(.\+\)</p>_<div class="gathalast">\1</div>_g
}

