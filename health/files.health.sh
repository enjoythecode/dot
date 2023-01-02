# Given a string, replaces any occurence of the value of $HOME with a tilda
#
# Parameters:
# $1 string to modify
#
# Examples:
# hi -> hi
# /Users/sinany-> ~
# /Users/sinany/S-> ~/S
function replace_home_string_with_tilda(){
	echo "${1/${HOME}/~}"
}


find "$S_PATH_TOSORT" -depth 1 \( ! -iname ".DS_Store" \) |
while IFS= read -r line;do
	linef=$(replace_home_string_with_tilda $line)
	echo "[!!] Unsorted folder/file at ${linef}"
done

if [[ $OSTYPE == 'darwin'* ]]; then
	find "$HOME/Downloads" -depth 1 \( ! -iname ".DS_Store" \) |
	while IFS= read -r line;do
		linef=$(replace_home_string_with_tilda $line)
		echo "[!!] Unsorted download file/folder at $linef"
	done
else
	echo "[!!] Downloads and Desktop folder paths not defined for non-mac OSs yet!"
fi
