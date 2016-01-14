Currently glib2 does not support support static linking because it 
uses DllMain hooks for initiation. Therefore we ship glib2 and its
dependencies as DLL files.

The 64bit DLLs are taken from msys2. The 32bit DLL's were compiled 
by Jeroen with msys/gcc-4.6.3 based off patched msys2 sources. 

```
CPPFLAGS="-IC:/msys32/local/include" \
LDFLAGS="-LC:/msys32/local/lib" \
LIBS="-lintl" \
../glib-2.46.2/configure \
  --disable-static \
  --enable-shared \
  --disable-libelf \
  --with-python=/c/msys2-x32/mingw32/bin/python \
  --with-threads=win32 \
  --with-xml-catalog=/c/msys2-x32/mingw32/etc/xml/catalog
```

Build Notes:
 - glib2 was recompiled with --threads=win32
 - renamed DllMain from gdk-pixbuf2 (we dont need DllMain).
 - gdk-pixbuf2 needs patch from mingw-packages to enable static.
 - libcairo also seems to have DllMain
