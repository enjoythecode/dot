#!/bin/bash

echo "[!!] Implement messages for tests that didn't find anything bad :)"

function find_and_run_health_script_in_directory() {
	find $1 -name "*.health.sh" | xargs -L 1 /bin/bash
}

find_and_run_health_script_in_directory "$S_PATH_DOT"
