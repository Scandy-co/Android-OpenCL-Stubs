#!/usr/bin/env bash
echo "Running build script."

# - Define "bail_if_fail" function for user feedback on last cmd status.
# - Look for per-developer/workdir env vars in ".env".
# - Look for default env vars in "default.env".
THIS_DIR=`dirname $0` ; source "$THIS_DIR/_common.bash"
bail_if_fail "load environment variables from .env and/or default.env"

# Build.
pushd "$BLD_DIR"
START_DATE="`date`"
make $MAKE_FLAGS

# Check exit status of build command.
bail_if_fail $exit_status "build app (started $START_DATE)"
popd
