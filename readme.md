# rsvg

New rsvg stack built from scratch with rtools gcc 4.9.3. Extends the rwinlib cairo v1.15.10 stack.

Versions:

 - rsvg 2.40.20
 - glib2 2.56.1
 - pango 1.42.1
 - harfbuzz 1.7.5
 - gdk-pixbuf 2.36.12
 - cairo stack: 1.15.10

Bugs:

 - We build gdk-pixbuf2 with all loaders bundled, however librsvg seems to also have a pixbuf loader `libpixbufloader-svg.dll`. I don't think we have that right now, or perhaps it's included with librsvg.a.

## Libs

Cairo libs copied from rwinlib/cairo v1.15.10
Pcre and lzma copied from rwinlib/base v3.5

## Static glib

Configured glib2 with:

    --with-threads=win32 \

Configured gdk-pixbuf2 with:

    --without-modules \
    --with-included-loaders=gdip-bmp,gdip-emf,gdip-gif,gdip-ico,gdip-jpeg,gdip-tiff,gdip-wmf

Configured harfbuzz with:

    --with-graphite2=no \
    --with-icu=no \

The following libs have to be compiled with `-DGLIB_STATIC_COMPILATION`:

 - gdk-pixbuf2
 - pango
 - librsvg

In addition librsvg itself needs to build with `-DLIBXML_STATIC`.  
