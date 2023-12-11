BEGIN {
	FS = "\t"
	infofile = length(group) > 0 ? "cst-" group ".info" : "cst-all.info"
	while((getline line < infofile) > 0) {
		split(line, dinfo, "\t")
		docid[dinfo[2]] = dinfo[1]
	}
	close(infofile)
}

{
	termfreq[$1] += $2
	spos = index(FILENAME, "/")
	docname = substr(FILENAME, spos + 1)
	dotpos = index(docname, ".")
	docname = substr(docname, 1, dotpos - 1)
	id = docid[docname]
	doc[id][$1] = $2
}

END {
	PROCINFO["sorted_in"] = "@ind_str_asc"
	for (word in termfreq) {
		docfreq = 0
		docdata = ""
		for (id in doc) {
			if (word in doc[id]) {
				docfreq++
				docdata = docdata id ":" doc[id][word] ","
			}
		}
		printf "%s\t%d\t%s\n", word, docfreq, docdata
	}
}
