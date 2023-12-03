BEGIN { FS = "\t" }

{
	freq[$1] += $2
}

END {
	if (sortlen)
		PROCINFO["sorted_in"] = "cmp_wordlen_desc"
	else
		PROCINFO["sorted_in"] = "@val_num_desc"
	if (dump) {
		for (word in freq)
			printf "%6d\t%s\n", freq[word], word
	} else {
		printf "Total terms: %d\n", length(freq)
		printf "Top %d:\n", topnum
		count = 0;
		for (word in freq) {
			if (++count > topnum)
				break
			printf "%6d\t%s\n", freq[word], word
		}
	}
}

function cmp_wordlen_desc(i1, v1, i2, v2)
{
	return length(i2)-length(i1)
}
