vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO oliverdixon/implot3d
    REF "bc1bf9b39f0cf91d0b6d49507ff50c15aa0ad4aa"
    SHA512 5a3c1c594d162a83bd8704061c583c57750623b01c72231d34895e19358e4fcb11cdbdf637358e5e76b7570310d33dff87bf7e57aa4d4ae8822de493264370fb
    HEAD_REF add-custom-getter-support
)

file(COPY "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt" DESTINATION "${SOURCE_PATH}")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS_DEBUG
        -DIMPLOT3D_SKIP_HEADERS=ON
)

vcpkg_cmake_install()

vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
