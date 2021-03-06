#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd fdk-aac

make clean

case $1 in
  armeabi-v7a | armeabi-v7a-neon)
    HOST=arm-linux
  ;;
  x86)
    HOST=i686-linux
  ;;
esac

./autogen.sh

./configure \
  --with-pic \
  --with-sysroot="$NDK_SYSROOT" \
  --host="$HOST" \
  --enable-static \
  --prefix="${TOOLCHAIN_PREFIX}" \
  --disable-shared || exit 1

make -j${NUMBER_OF_CORES} install || exit 1

popd
