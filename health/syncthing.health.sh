num_conflict_files="$(find "$S_PATH_S" -type f \( -iname "*sync-conflict*" ! -path "*stversions*" \) | wc -l)"
echo "[!!] There are $num_conflict_files syncthing conflicts. Suggestion: go through the files in $S_PATH_S or implement some automation around this!"
