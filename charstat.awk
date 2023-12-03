BEGIN { FS = "\t" }

{
	freq[$1] += $2
}

END {
	for (char in freq)
		printf "%s\t%d\n", char, freq[char]
}
