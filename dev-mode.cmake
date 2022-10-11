
set(root ${CMAKE_SOURCE_DIR}/CMake)
set(my_custom_target dev-mode.custom.cmake)

if(EXISTS ${root}/pre-${my_custom_target})
	include(${root}/pre-${my_custom_target})
endif()

if(NOT ${CMAKE_PROJECT_NAME}_DEVELOPER_MODE)
	return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
	message(AUTHOR_WARNING "Developer mode is intended for developers of ${CMAKE_PROJECT_NAME}")
endif()

include(CMake/folders.cmake)

include(CTest)

if(BUILD_TESTING)
	add_subdirectory(test)
endif()

option(BUILD_MCSS_DOCS "Build documentation using Doxygen and m.css" OFF)

if(BUILD_MCSS_DOCS)
	include(CMake/docs.cmake)
endif()

option(ENABLE_COVERAGE "Enable coverage support separate from CTest's" OFF)

if(ENABLE_COVERAGE)
	include(CMake/coverage.cmake)
endif()

if(CMAKE_HOST_SYSTEM_NAME STREQUAL "Windows")
	include(CMake/open-cpp-coverage.cmake OPTIONAL)
endif()

include(CMake/lint-targets.cmake)
include(CMake/spell-targets.cmake)

add_folders(Project)

if(EXISTS ${root}/post-${my_custom_target})
	include(${root}/post-${my_custom_target})
endif()

unset(root)
unset(my_custom_target)
