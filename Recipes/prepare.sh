#!/bin/bash

echo "Preparing the 'openddl-parser' library for the installation" && \
  git submodule init && git submodule update && \
  echo "The 'openddl-parser' library is prepared for the installation"
