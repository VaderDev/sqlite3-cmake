sqlite3-cmake
=============

Simplest CMake script + full sqlite3 amalgamation distibution to build with different compilers

Update from the upstream (based on git tags from [sqlite/tags](https://github.com/sqlite/sqlite/tags)):
```
  ./update "version-3.38.5"
```

Build
```
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/home/libs
  ninja install
```
