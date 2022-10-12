
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

set(autodir CMake/automatic)

if(BUILD_TESTING)
	add_subdirectory(${${CMAKE_PROJECT_NAME}_test_dir})
endif()

option(BUILD_MCSS_DOCS "Build documentation using Doxygen and m.css" OFF)

if(BUILD_MCSS_DOCS)
	include(${autodir}/docs.cmake)
endif()

option(ENABLE_COVERAGE "Enable coverage support separate from CTest's" OFF)

if(ENABLE_COVERAGE)
	include(${autodir}/coverage.cmake)
endif()

include(${autodir}/lint-targets.cmake)
include(${autodir}/spell-targets.cmake)

add_folders(Project)

if(EXISTS ${root}/post-${my_custom_target})
	include(${root}/post-${my_custom_target})
endif()

unset(root)
unset(my_custom_target)
