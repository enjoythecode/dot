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


num_unsorted_files="$(find "$S_PATH_TOSORT" | wc -l)"
# TODO: print [OK] message if no unsorted files
echo "[!!] There are $num_unsorted_files unsorted files. Suggestion: go through the files in $S_PATH_TOSORT"

if [[ $OSTYPE == 'darwin'* ]]; then

	downloads_path="$HOME/Downloads"
	num_unsorted_downloads="$(find "$downloads_path" -depth 1 \( ! -iname ".DS_Store" \) | wc -l)"
	echo "[!!] There are $num_unsorted_downloads unsorted downloads. Suggestion: go through the files in $downloads_path"
	while IFS= read -r line;do
		linef=$(replace_home_string_with_tilda $line)
		echo "[!!] Unsorted download file/folder at $linef"
	done
else
	echo "[!!] Downloads and Desktop folder paths not defined for non-mac OSs yet!"
fi
