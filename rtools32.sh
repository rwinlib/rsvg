#!/bin/sh
RCONFIG="/c/Progra~1/R/R-3.4.4/bin/i386/R CMD config"
CXX11="`$RCONFIG CXX11`"
CXX11STD="`$RCONFIG CXX11STD`"
export CPPFLAGS="-DGLIB_STATIC_COMPILATION -DLIBXML_STATIC -I/mingw32/include"
export CXX="$CXX11 $CXX11STD $CPPFLAGS"
export CXXCPP="`$RCONFIG CXXCPP` $CPPFLAGS"
export CXXFLAGS="`$RCONFIG CXXFLAGS`"
export CC="`$RCONFIG CC` $CPPFLAGS"
export CPP="`$RCONFIG CPP` $CPPFLAGS"
export CFLAGS="`$RCONFIG CFLAGS`"

# Link against mingw64 libs.
export LIBS="-L/mingw32/lib -lgdiplus -lgdi32 -lole32"

