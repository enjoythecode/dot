find "$S_PATH_TOSORT" -type f \( ! -iname ".DS_Store" \) |
while IFS= read -r line;do
	echo "[!!] Unsorted file at $line"
done

if [[ $OSTYPE == 'darwin'* ]]; then
	find "$HOME/Downloads" -type f \( ! -iname ".DS_Store" \) |
	while IFS= read -r line;do
		echo "[!!] Unsorted download at $line"
	done
else
	echo "[!!] Downloads and Desktop folder paths not defined for non-mac OSs yet!"
fi
