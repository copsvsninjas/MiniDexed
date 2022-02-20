#!/bin/bash

set -e 
set -x

[ -z "${RPI}" ] ; then
  echo "${RPI} missing, exting"
  exit 1
fi

# Build circle-stdlib library
cd circle-stdlib/
./configure -r ${RPI} --prefix "aarch64-none-elf-"
make -j$(nproc)
cd ..

# Build MiniDexed
cd src
make -j$(nproc)
ls *.img
cd ..