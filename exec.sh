#!/bin/bash

export JEKYLL_VERSION=3.8
docker run --rm \
  --volume="$PWD:/srv/jekyll:Z" \
  --publish [::1]:4000:4000 \
  --publish [::1]:35729:35729 \
  jekyll/jekyll:3.8.6 \
  jekyll serve --livereload --incremental

