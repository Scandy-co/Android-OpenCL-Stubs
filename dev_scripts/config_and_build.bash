#!/usr/bin/env bash
echo "Running config/build convenience script."

# - Define "bail_if_fail" function for user feedback on last cmd status.
# - Look for per-developer/workdir env vars in ".env".
# - Look for default env vars in "default.env".
THIS_DIR=`dirname $0` ; source "$THIS_DIR/_common.bash"
bail_if_fail "load environment variables from .env and/or default.env"

"$THIS_DIR/$CONFIG_SCR"; bail_if_fail "run config script."
"$THIS_DIR/$BUILD_SCR"; bail_if_fail "run build script."
