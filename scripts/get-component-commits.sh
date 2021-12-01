#!/usr/bin/env bash -e

##
# Output the commits that have been merged to a service component repository as-
# of the specified chart version.
#
# # How it works
#
# This script will discover the old versions of by grepping their
# kubernetes descriptor file (component): `api-deployment.yaml`,
# `sockets-statefulset.yaml`, and so on. To get an older version of a file, it
# will be extracted from the git version tag at the specified version.
#
# Arguments:
#
#      `--repo`: The repository name of the component service (under the
#                cobrowseio namespace)
# `--component`: The name of the component file from which to extract the
#                current and previous referenced version
#   `--version`: The source version from which to get component version
#                references. If unspecified, will use the version specified in
#                the working copy of `Chart.yaml`. This is usually what you want.
##

usage() { echo "Usage: $0 --repo <repo name (e.g., cobrowse-api)> --component <name (one of: api-deployment, proxy-deployment, recording-deployment, sockets-statefulset)> --version <helm chart version (e.g., 1.2.3)>]" 1>&2; exit 1; }

REPO=""
COMPONENT=""
CHART_VERSION=""

while [ "${1:-}" != "" ]; do
  case "$1" in
    "-r" | "--repo")
      shift
      REPO="$1"
      ;;
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

if [ -z "$REPO" ]; then
  echo "Must specify a repo (--repo)." 1>&2
  usage
fi

if [ -z "$COMPONENT" ]; then
  echo "Must specify a component (--component)." 1>&2
  usage
fi

if [ -z "$CHART_VERSION" ]; then
  echo "Must specify the beginning helm chart version (--version)." 1>&2
  usage
fi

GIT_URL="https://$COBROWSEIO_GITHUB_TOKEN@github.com/cobrowseio/$REPO.git"
GIT_DIR="/tmp/.$COMPONENT.git"

FROM=$(./scripts/get-component-version.sh -c "$COMPONENT" -v "$CHART_VERSION")
TO=$(./scripts/get-component-version.sh -c "$COMPONENT")

rm -rf "$GIT_DIR"
git clone -q --filter=blob:none --bare "$GIT_URL" "$GIT_DIR"
git --git-dir "$GIT_DIR" log --pretty=format:"* %s (%h)" --first-parent "v$FROM...v$TO"
