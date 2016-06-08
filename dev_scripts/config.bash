#!/usr/bin/env bash
echo "Running CMake config script."

# - Define "bail_if_fail" function for user feedback on last cmd status.
# - Look for per-developer/workdir env vars in ".env".
# - Look for default env vars in "default.env".
THIS_DIR=`dirname $0` ; source "$THIS_DIR/_common.bash"
bail_if_fail "load environment variables from .env and/or default.env"

# Configure.
rm -fr "$BLD_DIR"
mkdir -p "$BLD_DIR"
pushd "$BLD_DIR"
START_DATE="`date`"
"$CMAKE_EXE" $CMAKE_FLAGS "$SRC_DIR"

# Check if config succeeded: makefile produced?
[ -f Makefile ]
bail_if_fail "configure build (started $START_DATE)"
popd
