#!/usr/bin/env bash

tag="${1:-master}"
echo "Updating to tag: $tag ..."

# Update / Fetch the sqlite source
git -C upstream_build checkout master
git -C upstream_build pull || git clone https://github.com/sqlite/sqlite.git upstream_build
git -C upstream_build checkout $1
mkdir upstream_build/build -p
cd upstream_build/build

# Build the "amalgamation" source files
../configure
make sqlite3.c -j 12

# Update the "amalgamation" source files
cp -T shell.c      ../../src/shell.c
cp -T sqlite3.c    ../../src/sqlite3.c
cp -T sqlite3.h    ../../src/sqlite3.h
cp -T sqlite3ext.h ../../src/sqlite3ext.h
