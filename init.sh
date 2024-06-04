#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Plugin name needed."
	exit 1
fi

old_name="my_plugin"
new_name="$1"

find . -type d | grep -v 'git' | sort -r | xargs rename "$old_name" "$new_name"
find . -type f | grep -v 'git' | sort -r | xargs rename "$old_name" "$new_name"
find . -type f | grep -v 'git' | grep -v "init.sh" | xargs sed -i "s/$old_name/$new_name/g"

rm -rf .git
rm -rf ./init.sh
git init -b main

echo "Done!"
