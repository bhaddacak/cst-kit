BEGIN {
	FS = "\t"
	split(query, qterms, /\s/)
	while((getline line < infofile) > 0) {
		split(line, dinfo, "\t")
		docfile[dinfo[1]] = dinfo[2]
		docname[dinfo[1]] = dinfo[3]
	}
	close(infofile)
}

{
	for (i in qterms) {
		if ($1 ~ qterms[i]) {
			term = $1
			df = $2
			idf = log(totaldoc/df)
			q_tfidf[term] = calweight(1, idf)
			split($3, ddata, ",")
			for (d in ddata) {
				if (length(ddata[d]) > 0) {
					split(ddata[d], dd, ":")
					dname = dd[1]
					tf = dd[2]
					doc_tfidf[term][dname] = calweight(tf, idf)
				}
			}
		}
	}
}

END {
	PROCINFO["sorted_in"] = "@val_num_desc"
	for (t in doc_tfidf) {
		for (d in doc_tfidf[t]) {
			similarity[d] +=  doc_tfidf[t][d] * q_tfidf[t]
			termfound[d] = termfound[d] " " t
		}
	}
	if (length(similarity) > 0)
		printf "%7s %-24s %s\n", "Score", "Document", "Term(s) found"
	else
		print "Nothing found"
	count = 1
	for (d in similarity) {
		if (count > maxresult)
			break
		if (length(filter) > 0) {
			patt = length(filter) == 1 ? "-?" filter "-" : "-" filter "-"
			if (docfile[d] !~ patt)
				continue
		} else {
			count++
		}
		docinfo = substr(docfile[d], 5) " (" substr(docname[d], 0, 11) ")"
		printf "%7.3f %-23s %s\n", similarity[d], docinfo, termfound[d]
	}
}

#  To moderate the output score range, 1 + log(tf) is used instead of mere tf.
#  So, the weight calculation (tf * idf) becomes (1 + log(tf)) * idf.
function calweight(tf, idf) {
	#return tf * idf # not good
	return (1 + log(tf)) * idf
}
