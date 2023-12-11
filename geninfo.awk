BEGIN { FS = ":" }

/"file"/ {
	file[++i] = remove_quotes($2)
}

/"name"/ {
	name[++j] = remove_quotes($2)
}

END {
	for (i in file) {
		if (length(group) > 0) {
			grp = length(group) == 1 ? "?" group : group;
			if (file[i] !~ "-" grp "-")
				continue
		}
		printf "%d\t%s\t%s\n", i, file[i], name[i]
	}
}

function remove_quotes(str, qpos, temp) {
	qpos = index(str, "\"")
	temp = substr(str, qpos + 1)
	qpos = index(temp, "\"")
	return substr(temp, 0, qpos - 1)
}
