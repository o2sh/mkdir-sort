#!/bin/bash
function f() {
	echo $(eval printf 'g/%.0s' {1.."$1"})"$1" | xargs mkdir -p
}

while [ -n "$1" ]
do
	f "$1"
	shift
done

find . -type d | sed 's#.*/##' | grep -v g
