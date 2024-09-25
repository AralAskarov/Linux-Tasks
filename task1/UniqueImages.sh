#!/bin/bash

unzip duplicate_files.zip -d images && find images -type f -not -path "*__MACOSX*" -exec sha256sum {} + | awk 'arr[$1]++ {print $2}' | xargs rm
