# This variable is set by project() in CMake 3.21+
if(${CMAKE_VERSION} VERSION_LESS "3.21.0")
	string(COMPARE EQUAL "${CMAKE_SOURCE_DIR}" "${PROJECT_SOURCE_DIR}" PROJECT_IS_TOP_LEVEL)
endif()

