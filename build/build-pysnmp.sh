#!/bin/bash
#
# build-pysnmp.sh - Build the pysnmp lambda layer.

pip install pysnmp --prefix python

zipfile=`echo $AWS_EXECUTION_ENV | sed "s#.*_#pysnmp-#"`
python <<HEREND
import shutil

shutil.make_archive('$zipfile','zip','.','python')
HEREND

rm -rf python

exit