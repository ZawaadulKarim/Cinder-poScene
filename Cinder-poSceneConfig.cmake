if(NOT TARGET Cinder-poScene)
    # Define ${Cinder-Notifications_PROJECT_ROOT}. ${CMAKE_CURRENT_LIST_DIR} is just the current directory.
    get_filename_component(Cinder-poScene_PROJECT_ROOT "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE)

    # Define ${CINDER_PATH} as usual.
    get_filename_component(CINDER_PATH "${Cinder-poScene_PROJECT_ROOT}/../.." ABSOLUTE)

    # Make a list of source files and define that to be ${SOURCE_LIST}.
    file(GLOB SOURCE_LIST CONFIGURE_DEPENDS "${Cinder-poScene_PROJECT_ROOT}/src/poScene/*.cpp")
    add_library(Cinder-poScene ${SOURCE_LIST})
    target_include_directories(Cinder-poScene PRIVATE "${Cinder-poScene_PROJECT_ROOT}/src/poScene" )
    target_include_directories(Cinder-poScene PUBLIC "${Cinder-poScene_PROJECT_ROOT}/src" )


    # If your Cinder block has no source code but instead pre-build libraries,
    # you can specify all of them here (uncomment the below line and adjust to your needs).
    # Make sure to use the libraries for the right platform.
    # # target_link_libraries(Cinder-Notifications ${Cinder-OpenCV_PROJECT_ROOT}/lib/libopencv_core.a)

    if(NOT TARGET cinder)
        include("${CINDER_PATH}/proj/cmake/configure.cmake")
        find_package(cinder REQUIRED PATHS
                "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
                "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}")
    endif()
    target_link_libraries(Cinder-poScene PRIVATE cinder)

endif()