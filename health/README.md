# Health Checks

This is a collection of scripts that check the health of my system and report
status, and if any, actions required, to me.

Entry point is `health.sh`. This calls the individual scripts in the form
`{THING}.health.sh`. Currently, the health check scripts are in this folder,
however, they could move in the future for better separation of concerns as well
as privacy since `dot` is public.

## Running

`h` is an alias to `run_custom_health_check_scripts`.

## Output Format

This is very tentative.

The first 4 characters are reserved for a line status, and the 5th character
is separated for a space character.

`[OK]` means the test was OK.
`[!!]` indicates a test that failed.
