#!/bin/bash

VERSION_SCRIPT="Version/version.sh"

if ! test -e "$VERSION_SCRIPT"; then

  echo "ERROR: The version script was not found at path: '$VERSION_SCRIPT'"
  exit 1
fi

# shellcheck disable=SC1090
. "$VERSION_SCRIPT" && \
  echo "Installing the '$VERSIONABLE_NAME' target, please wait" && \
  cd "Library" && \
  rm -rf ./Build && \
  mkdir Build && \
  cd Build && \
  cmake -GNinja .. && \
  ninja -j "$(nproc)" && \
  sudo ninja install && \
  echo "The '$VERSIONABLE_NAME' target has been installed with success" && \
  cd .. && rm -rf ./Build

# Install log example:
#
#-- Install configuration: ""
#-- Installing: /usr/local/lib/libopenddlparser.a
#-- Installing: /usr/local/include/openddlparser/OpenDDLCommon.h
#-- Installing: /usr/local/include/openddlparser/OpenDDLExport.h
#-- Installing: /usr/local/include/openddlparser/OpenDDLParser.h
#-- Installing: /usr/local/include/openddlparser/OpenDDLParserUtils.h
#-- Installing: /usr/local/include/openddlparser/OpenDDLStream.h
#-- Installing: /usr/local/include/openddlparser/DDLNode.h
#-- Installing: /usr/local/include/openddlparser/Value.h
#-- Installing: /usr/local/include/openddlparser/TPoolAllocator.h
#-- Installing: /usr/local/lib/cmake/openddlparser/openddlparser-config.cmake
#-- Installing: /usr/local/lib/cmake/openddlparser/openddlparser-config-noconfig.cmake
#-- Installing: /usr/local/lib/cmake/openddlparser/openddlparser-config-version.cmake

