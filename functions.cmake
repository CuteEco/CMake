# This function collects the directories in dir_path
function(load_directories_list dir_path result)
	file(GLOB_RECURSE headers_list ${dir_path}/*.h)
	set(dir_list "")

	foreach(file_path ${headers_list})
		get_filename_component(dir_path ${file_path} PATH)
		set(dir_list "${dir_list};${dir_path}")
	endforeach()

	list(REMOVE_DUPLICATES dir_list)
	set(${result} ${dir_list} PARENT_SCOPE)
endfunction()

# This function puts cpp, h, hpp, ui, qrc and ts files into result
function(load_sources_list dir_path result)
	file(GLOB_RECURSE sources
		${dir_path}/*.cpp
		${dir_path}/*.hpp
		${dir_path}/*.c
		${dir_path}/*.h
	)
	list(REMOVE_DUPLICATES sources)
	set(${result} ${sources} PARENT_SCOPE)
endfunction()

macro(fetch_from_git name gituser version)
	include(FetchContent)
	message(STATUS "Fetching ${name} ${version} from https://github.com/${gitrepo}/${name}.git")
	FetchContent_Declare(${name}
		GIT_REPOSITORY https://github.com/${gitrepo}/${name}.git
		GIT_TAG ${version}
	)
	FetchContent_MakeAvailable(${name})
endmacro()