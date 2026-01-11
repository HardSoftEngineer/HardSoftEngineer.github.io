#!/usr/bin/env bash
set -e

#
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SITE_DIR="$SCRIPT_DIR/../../site"
DOCKER_IMAGE="ghcr.io/gohugoio/hugo:v0.154.4"

cd "$SCRIPT_DIR"

if [ -f "$SITE_DIR/hugo.toml" ]; then
  echo "Hugo site already initialized, skipping."
  exit 0
fi

mkdir -p "$SITE_DIR"

docker run --rm -it \
  -v "$SITE_DIR:/project" \
  $DOCKER_IMAGE \
  new site /project
return_code=$?
echo "return_code: $return_code"
