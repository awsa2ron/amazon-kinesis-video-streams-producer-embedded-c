set(V4L2CAPTURER_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libraries/3rdparty/v4l2capturer)

find_package(PkgConfig REQUIRED)
pkg_check_modules(LIBV4L2 REQUIRED libv4l2)

set(V4L2CAPTURER_SRC
    ${V4L2CAPTURER_DIR}/src/V4l2Capturer.c
)

set(V4L2CAPTURER_INC
    ${V4L2CAPTURER_DIR}/include
)

set(CMAKE_C_STANDARD 11)

add_library(v4l2capturer-shared SHARED ${V4L2CAPTURER_SRC})
target_include_directories(v4l2capturer-shared PRIVATE ${LIBV4L2_INCLUDE_DIRS})
target_include_directories(v4l2capturer-shared PUBLIC ${V4L2CAPTURER_INC})
set_target_properties(v4l2capturer-shared PROPERTIES OUTPUT_NAME v4l2capturer)
target_link_libraries(v4l2capturer-shared PRIVATE ${LIBV4L2_LIBRARIES})

add_library(v4l2capturer-static STATIC ${V4L2CAPTURER_SRC})
target_include_directories(v4l2capturer-static PRIVATE ${LIBV4L2_INCLUDE_DIRS})
target_include_directories(v4l2capturer-static PUBLIC ${V4L2CAPTURER_INC})
set_target_properties(v4l2capturer-static PROPERTIES OUTPUT_NAME v4l2capturer)
target_link_libraries(v4l2capturer-static PRIVATE ${LIBV4L2_LIBRARIES})
