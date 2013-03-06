#!/bin/bash
set -e -u
ARCHIVE=qt-everywhere-opensource-src-4.8.0.tar.gz
ARCHIVEDIR=qt-everywhere-opensource-src-4.8.0
. $KOBO_SCRIPT_DIR/build-common.sh

pushd $ARCHIVEDIR
	./configure $CPPFLAGS $LIBS -release -no-accessibility -system-libmng -no-nis -no-cups -no-xshape -no-xrandr -no-xkb -no-xinerama -no-xcursor -no-sm -qt-libpng -system-libjpeg -qt-zlib -embedded arm -xplatform qws/linux-arm-g++ -no-qt3support -exceptions -opensource -no-pch -qt-freetype -qt-gfx-qvfb -confirm-license -dbus -ldbus-1 -nomake examples -nomake docs -nomake translations -nomake demos -scripttools -xmlpatterns -no-opengl -depths all -qt-gfx-transformed -qt-gfx-linuxfb -no-mouse-pc -no-mouse-linuxtp -no-mouse-linuxinput -no-mouse-tslib -no-mouse-qvfb -no-mouse-qnx -no-armfpa -no-neon -openssl -lrt -I${DEVICEROOT}/include/dbus-1.0 -I${DEVICEROOT}/lib/dbus-1.0/include $QT_EXTRA_ARGS
	$MAKE 
	$MAKE install
popd
markbuilt
