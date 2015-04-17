#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd libvpx

make clean

./configure \
  --target=armv7-android-gcc \
  --disable-examples \
  --sdk-path=${ANDROID_NDK} \
  --prefix="${TOOLCHAIN_PREFIX}" || exit 1

make -j${NUMBER_OF_CORES} install || exit 1

popd
