#!/bin/bash
function f() {
	echo $(eval printf 'g/%.0s' {1.."$1"})"$1" | xargs mkdir -p
}

while [ -n "$1" ]
do
	f "$1"
	shift
done

ls -lLR | grep "^d" | awk '{print $9}' | grep -v g
