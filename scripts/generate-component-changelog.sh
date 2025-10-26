#!/usr/bin/env bash

set -e

##
# Output a changelog for each referenced service component as-of the previous
# released version of this Chart.
#
# When running this script, the "previous released version" of the chart is
# considered to be what is found in the `Chart.yaml` `version: <version>`
# property in the current working copy. If you need to pull changelogs from
# an older version, use the -v flag to specify an older version of the chart.
#
# # How it works
#
# This script will discover the old versions of by grepping their
# kubernetes descriptor file: `api-deployment.yaml`, `sockets-statefulset.yaml`,
# and so on. To get an older version of a file, it will be extracted from the
# git version tag at the specified version.
#
# Arguments:
#
# `--prev-version`: The source version from which to get component version
#                   references. If unspecified, will use the version specified
#                   in the working copy of `Chart.yaml`. This is usually what
#                   you want.
##

HELM_PREV_VERSION=$(./scripts/get-chart-version.sh)

usage() { echo "Usage: $0 [--prev-version <helm chart version (default: $HELM_PREV_VERSION)>]" 1>&2; exit 1; }

while [ "${1:-}" != "" ]; do
  case "$1" in
    "-p" | "--prev-version")
      shift
      HELM_PREV_VERSION="$1"
      ;;
    *)
      usage
  esac
  shift
done

output_changelog () {
  local OUT="$(./scripts/get-component-commits.sh -r $1 -c $2 -v $HELM_PREV_VERSION)"
  if [ -n "$OUT" ]; then
    echo "$OUT"
  else
    echo "No changes."
  fi
}

echo "Release v{VERSION}"
echo ""
echo "## Deployment instructions "
echo "Run \`helm upgrade\`"
echo ""
echo "## Detailed changes"
echo ""
echo "### Cobrowse Enterprise Helm"
git log --pretty=format:"* %s (%h)" --first-parent "v$HELM_PREV_VERSION...HEAD"
echo ""
echo "### Cobrowse Enterprise API"
output_changelog cobrowse-api api-deployment $HELM_PREV_VERSION
echo ""
echo "### Cobrowse Enterprise Sockets"
output_changelog cobrowse-api-sockets sockets-statefulset $HELM_PREV_VERSION
echo ""
echo "### Cobrowse Enterprise Proxy"
output_changelog cobrowse-proxy proxy-deployment $HELM_PREV_VERSION
echo ""
echo "### Cobrowse Enterprise Recording"
output_changelog cobrowse-recording recording-deployment $HELM_PREV_VERSION
echo ""
echo "### Cobrowse Enterprise Frontend"
output_changelog cobrowse-frontend frontend-deployment $HELM_PREV_VERSION
echo ""
echo "### Cobrowse Enterprise Virtual Agent"
output_changelog cobrowse-virtual-agent virtual-agent-deployment $HELM_PREV_VERSION
