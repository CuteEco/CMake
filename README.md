<br/>
<p align="center">
	<img src="assets/CuteCMakeLogo.png" />
</p>

<div align="center">
<h3><tt>Just the <b>cutes</b> way to develop your games 😽</tt></h4>

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

</div>

## Attention:

You have to set 3 variables to use this repository:

```cmake
set(${CMAKE_PROJECT_NAME}_include_dir code/include)
set(${CMAKE_PROJECT_NAME}_source_dir code/source)
set(${CMAKE_PROJECT_NAME}_test_dir test)
```

Of course, you can use any path for every variable, but those variables have to be

## Development:

You can use your own scripts by placing them in the `custom/` directory or using this template for
naming your files: `<name>.custom.cmake`

Every cmake file in this repository have the following code in the start of itself:

```cmake
if(EXISTS ${CMAKE_SOURCE_DIR}/CMake/pre-<filename>.custom.cmake)
	include(${CMAKE_SOURCE_DIR}/CMake/pre-<filename>.custom.cmake)
endif()
```

and the following code in the end of itself:

```cmake
if(EXISTS ${CMAKE_SOURCE_DIR}/CMake/pre-<filename>.custom.cmake)
	include(${CMAKE_SOURCE_DIR}/CMake/pre-<filename>.custom.cmake)
endif()
```

So, You can add your own behavior for every instance.
