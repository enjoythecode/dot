find "$S_PATH_S" -type f \( -iname "*sync-conflict*" ! -path "*stversions*" \) |
while IFS= read -r line;do
    echo "[!!] Syncthing conflict at $line"
done
