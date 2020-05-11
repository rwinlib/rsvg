# LIBRSVG 2.48.4

Note: this stack requires Windows 7 and therefore doensn't work on WinBuilder (which still runs Windows Vista/2008).

Evertyhing was built with rtools40 except for these:

 - glib2: from rtools-backports
 - librsvg.a: copied from msys2 (needs rust to build)
 - libcairo-gobject.a: copied from msys2 (our cairo doens't have glib bindings)

Use the following flags to build:

```
PKG_CPPFLAGS= \
	-I$(RWINLIB)/include/librsvg-2.0 \
	-I$(RWINLIB)/include/glib-2.0 \
	-I$(RWINLIB)/lib${R_ARCH}/glib-2.0/include \
	-I$(RWINLIB)/include/gdk-pixbuf-2.0 \
	-I$(RWINLIB)/include/cairo

PKG_LIBS= \
	-L$(RWINLIB)/lib${R_ARCH} \
	-lrsvg-2 -lxml2 \
	-lpangocairo-1.0 -lpango-1.0 -lpangowin32-1.0 \
	-lcairo -lfreetype -lpixman-1 -lgdk_pixbuf-2.0 \
	-lcairo-gobject -lgio-2.0 -lgobject-2.0 -lgmodule-2.0 -lglib-2.0 \
	-lffi -lpcre -lpng16 -lintl -lz -liconv -lfribidi \
	-lusp10 -liphlpapi -lgdiplus -lgdi32 -lole32 -ldnsapi -lws2_32 -luserenv
```
