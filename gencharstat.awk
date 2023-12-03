BEGIN { FS = "" }

{
	for (i = 1; i <= NF; i++)
		freq[$i]++
}

END {
	for (char in freq)
		printf "%s\t%d\n", char, freq[char]
}
