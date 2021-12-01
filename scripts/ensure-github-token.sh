#!/usr/bin/env bash -e

if [ -z "$GITHUB_TOKEN" ]; then
  echo "You must have GITHUB_TOKEN set with repo access" 1>&2
  exit 1
fi
