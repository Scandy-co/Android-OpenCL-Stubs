#!/usr/bin/env bash

# bail_if_fail:
# prints message saying whether command succeeded or failed; if failed, exits.
bail_if_fail () {
  if [ $? -eq 0 ]; then
    echo -e "*** Success: $1 (finished `date`) ***"
  else
    echo -e "*** Fail: $1 (finished `date`) ***" >&2
    exit -1
  fi
}

terse_bail_if_fail () {
  if [ $? -ne 0 ]; then
    echo -e "*** Fail: $1 ***" >&2
    exit -1
  fi
}

# Load env vars from developer's .env file if present.
DOT_ENV="$THIS_DIR/../.env"
if [ -f "$DOT_ENV" ]; then
  echo "*** Found .env file at $DOT_ENV, loading ***"
  source "$DOT_ENV"
else
  echo "*** Found no .env file, skipping ***"
fi

# Load env vars from default.env file if present.
DEFAULT_ENV="$THIS_DIR/../default.env"
if [ -f "$DEFAULT_ENV" ]; then
  echo "*** Found default.env file at $DEFAULT_ENV, loading ***"
  source "$DEFAULT_ENV"
else
  echo "*** Found no default.env file, skipping ***"
fi
