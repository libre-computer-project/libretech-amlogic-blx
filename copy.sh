#!/bin/bash
set -x
if [ -z "$1" -o -z "$2" ]; then
	echo "Usage: $0 SOURCE DESTINATION" >&2
	exit 1
fi

if [ ! -d "$1" ]; then
	echo "$1 is not a directory." >&2
	exit 1
fi

if [ ! -d "$2" ]; then
	echo "$2 is not a directory." >&2
	exit 1
fi

files=("bl2_new.bin" "bl30_new.bin" "bl31.img")

for file in ${files[@]}; do
	if [ ! -f "$1/$file" ]; then
		echo "$1/$file does not exist." >&2
		exit 1
	fi
done

for file in ${files[@]}; do
	cp "$1/$file" "$2/$file"
done
