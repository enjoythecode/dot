if [ "$(ls -A ~/S/Archive/ToSort/)" ]; then
	for file in ~/S/Archive/ToSort/*
	do
		echo "[!!] Unsorted file in ~/S/Archive/ToSort$file"
	done
else
	echo "[OK] All files in ~/S/Archive/ToSort have been sorted away."
fi
