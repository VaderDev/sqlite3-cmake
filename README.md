sqlite3-cmake
=============

Simple CMake script + full sqlite3 amalgamation distibution

Update from the upstream (based on [sqlite/tags](https://github.com/sqlite/sqlite/tags)):
```
./update.sh "version-3.38.5"
```

Build
```
mkdir -p build
cd build
cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/desired/path ..
ninja install
```
