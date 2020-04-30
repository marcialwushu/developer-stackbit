#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5eaa3d3286302300129ccaa3/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5eaa3d3286302300129ccaa3
curl -s -X POST https://api.stackbit.com/project/5eaa3d3286302300129ccaa3/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5eaa3d3286302300129ccaa3/webhook/build/publish > /dev/null
