#!/bin/bash

function find_and_run_health_script_in_directory() {
	find $1 -name "*.health.sh" | xargs /bin/bash
}

find_and_run_health_script_in_directory ~/dot
