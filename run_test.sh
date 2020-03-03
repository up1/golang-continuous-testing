#!/bin/bash
which fswatch >/dev/null || err "you need 'fswatch' command (brew install fswatch)"
fswatch -x *.go **/*.go | while read x; do
    go test -v ./... | sed ''/PASS/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/''
done