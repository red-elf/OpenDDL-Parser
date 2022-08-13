#!/bin/bash

HERE="$(pwd)"
VERSION="set(PACKAGE_VERSION "
VERSION_CLOSING=")"
VERSION_SCRIPT="$HERE/Version/version.sh"

if ! test -e "$VERSION_SCRIPT"; then

  echo "ERROR: The version script was not found at path: '$VERSION_SCRIPT'"
  exit 1
fi

# shellcheck disable=SC2002
# shellcheck disable=SC1090
. "$VERSION_SCRIPT" && \
  RAW="$(cat /usr/local/lib/cmake/"$VERSIONABLE_NAME"/"$VERSIONABLE_NAME"-config-version.cmake | grep \
  "$VERSION" -m 1)" && \
  RAW="${RAW/$VERSION/}" && \
  echo "${RAW/$VERSION_CLOSING/}" | xargs