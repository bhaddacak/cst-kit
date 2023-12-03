BEGIN { FS = "[][!()+,-.:;=?–‘’“”… ]+" }

{
	for (i = 1; i <= NF; i++) {
		term = keepcap ? $i : tolower($i)
		freq[term]++
	}
}

END {
	for (word in freq) {
		if (length(word) > 0 && word !~ /^[0-9]+/)
			printf "%s\t%d\n", word, freq[word]
	}
}

