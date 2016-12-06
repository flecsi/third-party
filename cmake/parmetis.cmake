set(PARMETIS_NAME parmetis)
set(PARMETIS_URL http://glaros.dtc.umn.edu/gkhome/fetch/sw/parmetis)
set(PARMETIS_GZ  parmetis-4.0.3.tar.gz)
set(PARMETIS_MD5 "f69c479586bf6bb7aff6a9bc0c739628")

message(STATUS "Building ${PARMETIS_NAME}")
ExternalProject_Add(${PARMETIS_NAME}
 URL ${PARMETIS_URL}/${PARMETIS_GZ}
 URL_MD5 ${PARMETIS_MD5}
 UPDATE_COMMAND ""
 PATCH_COMMAND patch -p1 < ${PROJECT_SOURCE_DIR}/patches/parmetis-4.0.3-cmake.patch
 CMAKE_ARGS
   -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
   -DCMAKE_CXX_COMPILER:FILEPATH=${CMAKE_CXX_COMPILER}
   -DCMAKE_CXX_FLAGS:STRING=${CMAKE_CXX_FLAGS}
   -DCMAKE_C_COMPILER:FILEPATH=${CMAKE_C_COMPILER}
   -DCMAKE_C_FLAGS:STRING=${CMAKE_C_FLAGS}
   -DSHARED:BOOL=${BUILD_SHARED_LIBS}
   -DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}
   -DMETIS_INSTALL=ON
   -DGKLIB_PATH=<SOURCE_DIR>/metis/GKlib/
   -DMETIS_PATH=<SOURCE_DIR>/metis/
   -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
   LOG_BUILD 1
)
