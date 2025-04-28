PROJECT(sqlite3)
cmake_minimum_required(VERSION 3.4)



if (NOT CMAKE_BUILD_TYPE)
	set(CMAKE_BUILD_TYPE RELEASE)
endif()

set(CMAKE_CONFIGURATION_TYPES "DEBUG;RELEASE" CACHE STRING "" FORCE)

if(CMAKE_BUILD_TYPE STREQUAL "DEBUG")
	add_compile_options(-Og)
	add_compile_options(-ggdb3)

elseif(CMAKE_BUILD_TYPE STREQUAL "RELEASE")
	add_compile_options(-O3)
#	add_definitions(-DNDEBUG)

else()
	message(WARNING "Failed to identify [${CMAKE_BUILD_TYPE}] as a build type")
endif()


OPTION(BUILD_SHELL "Build the sqlite3 shell." ON)


# -----------------------------------------------------------------------------------

add_library(sqlite3 STATIC src/sqlite3.c src/sqlite3.h src/sqlite3ext.h)
target_include_directories(sqlite3 PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src)

if(BUILD_SHELL)
	add_executable(sqlite src/sqlite3.c src/shell.c src/sqlite3.h src/sqlite3ext.h)
	target_include_directories(sqlite PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src)
	#set_target_properties(sqlite PROPERTIES OUTPUT_NAME sqlite3)
endif()

add_definitions(-DSQLITE_ENABLE_RTREE)
add_definitions(-DSQLITE_ENABLE_FTS4)
add_definitions(-DSQLITE_ENABLE_FTS5)
add_definitions(-DSQLITE_ENABLE_RBU)
add_definitions(-DSQLITE_ENABLE_STAT4)
# add_definitions(-DSQLITE_ENABLE_JSON1) since 3.38 its builtin

# Uncomment this for single-threaded variant (faster)
#add_definitions(-DSQLITE_THREADSAFE=0)


install(FILES src/sqlite3.h src/sqlite3ext.h DESTINATION include/sqlite3/)
install(TARGETS sqlite3 LIBRARY DESTINATION lib/ ARCHIVE DESTINATION lib/)

if(BUILD_SHELL)
	install(TARGETS sqlite RUNTIME DESTINATION bin/)
endif()
