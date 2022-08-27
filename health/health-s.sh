find "$S_PATH_TOSORT" -type f \( ! -iname ".DS_Store" \) |
while IFS= read -r line;do
	echo "[!!] Unsorted file at $line"
done
