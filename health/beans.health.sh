
cd "$S_PATH_S/beans" && make check
# todo(sy) what is the return value of a && statement in bash? am I actually
# catching the correct error code?
Last_Command=$? # Must come right after the check!

if [[ $Last_Command == 0 ]]; then
    echo "[OK] Beancount is healthy"
else
    echo "[!!] Beancount reported issues"
fi
