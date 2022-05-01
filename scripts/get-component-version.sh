#!/usr/bin/env bash -e

##
# Given a Chart version, get the version of the component service linked in the
# deployment.
#
# Arguments:
#   `--component`: The name of the file that contains the version reference to
#                  the component.
#     `--version`: The version of the Chart whose component version reference to
#                  extract. If unspecified, it will take the version from the
#                  local working copy. This version must represent a previously
#                  tagged version (excluding the preceding 'v')
#
# Examples:
#
# Get the current version referenced for the recording deployment:
# `$ ./scripts/get-component-version.sh -c recording-deployment`
#
# Get the version referenced for the api sockets deployment in Chart version v1.5.10:
# `$ ./scripts/get-component-version.sh -c sockets-statefulset -v 1.5.10`
##

usage() { echo "Usage: $0 --component <name (one of: api-deployment, proxy-deployment, recording-deployment, sockets-statefulset)> [--version <helm chart version (e.g., 1.2.3)>]" 1>&2; exit 1; }

COMPONENT=""
CHART_VERSION=""

while [ "${1:-}" != "" ]; do
  case "$1" in
    "-v" | "--version")
      shift
      CHART_VERSION="$1"
      ;;
    "-c" | "--component")
      shift
      COMPONENT="$1"
      ;;
    *)
      usage
  esac
  shift
done

if [ -z "$COMPONENT" ]; then
  echo "Must specify a component (--component)."
  usage
fi

get_past_version () {
  git show "v$2:./templates/$1.yaml" \
    | grep ghcr.io/cobrowseio \
    | grep -Eo ":[0-9]+.[0-9]+.[0-9]+" \
    | head -n 1 \
    | cut -c2-
}

get_current_version () {
  cat "./templates/$1.yaml" \
    | grep ghcr.io/cobrowseio \
    | grep -Eo ":[0-9]+.[0-9]+.[0-9]+" \
    | head -n 1 \
    | cut -c2-
}

if [ -z "$CHART_VERSION" ]; then
  echo "$(get_current_version $COMPONENT)"
else
  echo "$(get_past_version $COMPONENT $CHART_VERSION)"
fi
