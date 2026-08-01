set(VCPKG_BUILD_TYPE release) # header-only library

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO oliverdixon/doctest
    REF 89085a3a1ad49b6f8a8238de960104935b5377d6
    SHA512 078afa8b98e9b8b815c76fd0ec397594aaa60a7893d0421f4ddbda0642371c56b88cbfdf552ec150e49d7b90ac8cda39e9260bbbcc485d02467797d5233b621e
    HEAD_REF disable-colours-when-parsing
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    DISABLE_PARALLEL_CONFIGURE
    OPTIONS
        -DDOCTEST_WITH_MAIN_IN_STATIC_LIB=OFF
        -DDOCTEST_WITH_TESTS=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})
vcpkg_fixup_pkgconfig()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
