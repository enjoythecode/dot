find "$S_PATH_TOSORT" -depth 1 \( ! -iname ".DS_Store" \) |
while IFS= read -r line;do
	echo "[!!] Unsorted folder/file at $line"
done

if [[ $OSTYPE == 'darwin'* ]]; then
	find "$HOME/Downloads" -depth 1 \( ! -iname ".DS_Store" \) |
	while IFS= read -r line;do
		echo "[!!] Unsorted download file/folder at $line"
	done
else
	echo "[!!] Downloads and Desktop folder paths not defined for non-mac OSs yet!"
fi
