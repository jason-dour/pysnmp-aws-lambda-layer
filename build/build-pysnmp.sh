#!/bin/bash
#
# build-pysnmp.sh - Build the pysnmp lambda layer.

pip install pysnmp --prefix python

version=`awk -F= '/VERSION/{print substr($2,0,3)}' /var/runtime/runtime-release`
zipfile="pysnmp-python${version}"
python <<HEREND
import shutil

shutil.make_archive('$zipfile','zip','.','python')
HEREND

rm -rf python

exit