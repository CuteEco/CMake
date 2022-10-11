set(fatal_err_message " variable which contains the path to your sources.")

if(NOT ${CMAKE_PROJECT_NAME}_source_dir)
	message(FATAL_ERROR "Please, add '${CMAKE_PROJECT_NAME}_source_dir' variable which contains the path to your sources.")
endif()

if(NOT ${CMAKE_PROJECT_NAME}_include_dir)
	message(FATAL_ERROR "Please, add '${CMAKE_PROJECT_NAME}_include_dir' variable which contains the path to your sources.")
endif()

if(NOT ${CMAKE_PROJECT_NAME}_test_dir)
	message(FATAL_ERROR "Please, add '${CMAKE_PROJECT_NAME}_test_dir' variable which contains the path to your sources.")
endif()

set(root ${CMAKE_SOURCE_DIR}/CMake)
set(my_custom_target lint-targets.custom.cmake)

if(EXISTS ${root}/pre-${my_custom_target})
	include(${root}/pre-${my_custom_target})
endif()

set(FORMAT_PATTERNS
	"${${CMAKE_PROJECT_NAME}_source_dir}/*.cpp"
	"${${CMAKE_PROJECT_NAME}_source_dir}/*.hpp"
	"${${CMAKE_PROJECT_NAME}_include_dir}/*.hpp"
	"${${CMAKE_PROJECT_NAME}_test_dir}/*.cpp"
	"${${CMAKE_PROJECT_NAME}_test_dir}/*.hpp"
	CACHE STRING "; separated patterns relative to the project source dir to format"
)

set(FORMAT_COMMAND clang-format CACHE STRING "Formatter to use")

add_custom_target(format-check COMMAND "${CMAKE_COMMAND}"
	-D "FORMAT_COMMAND=${FORMAT_COMMAND}"
	-D "PATTERNS=${FORMAT_PATTERNS}"
	-P "${PROJECT_SOURCE_DIR}/CMake/automatic/lint.cmake"
	WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
	COMMENT "Linting the code"
	VERBATIM
)

add_custom_target(format-fix COMMAND "${CMAKE_COMMAND}"
	-D "FORMAT_COMMAND=${FORMAT_COMMAND}"
	-D "PATTERNS=${FORMAT_PATTERNS}"
	-D FIX=YES
	-P "${PROJECT_SOURCE_DIR}/CMake/automatic/lint.cmake"
	WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
	COMMENT "Fixing the code"
	VERBATIM
)

if(EXISTS ${root}/post-${my_custom_target})
	include(${root}/post-${my_custom_target})
endif()

unset(root)
unset(my_custom_target)
