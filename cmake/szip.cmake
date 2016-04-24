set(SZIP_NAME szip)
string(TOLOWER ${SZIP_NAME} SZIP_PACKAGE_NAME)
set(SZIP_URL ${PROJECT_SOURCE_DIR}/files)
set(SZIP_TGZ SZip.tar.gz)
set(SZIP_MD5 "a966afca7fb9f9cc65568f35a7037f57")

ExternalProject_Add(${SZIP_NAME}
  URL ${SZIP_URL}/${SZIP_TGZ}
  URL_MD5 ${SZIP_MD5}
  UPDATE_COMMAND ""
  CMAKE_ARGS
    -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
    -DCMAKE_C_COMPILER:FILEPATH=${CMAKE_C_COMPILER}
    -DCMAKE_C_FLAGS:STRING=${CMAKE_C_FLAGS}
    -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
    -DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}
)

set(SZIP_INCLUDE_DIR ${CMAKE_INSTALL_PREFIX}/include)
set(SZIP_LIBRARIES ${CMAKE_INSTALL_PREFIX}/lib/${CMAKE_LIBRARY_PREFIX}szip${CMAKE_LIBRARY_SUFFIX})
