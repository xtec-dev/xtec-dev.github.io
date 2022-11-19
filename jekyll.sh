#!/bin/bash

export JEKYLL_VERSION=3.8.6

run() {

    docker run --rm \
        --env JEKYLL_UID=$UID \
        --env JEKYLL_GID=$UID \
        --volume="$PWD:/srv/jekyll" \
        --volume="$PWD/_site:/srv/jekyll/_site" \
        --volume="$PWD/_bundle:/usr/local/bundle" \
        --publish 4000:4000 \
        --publish 35729:35729 \
        jekyll/jekyll:$JEKYLL_VERSION \
        jekyll serve --livereload --incremental
}

update() {

    docker run --rm \
        --env JEKYLL_UID=$UID \
        --env JEKYLL_GID=$UID \
        --volume="$PWD:/srv/jekyll" \
        --volume="$PWD/_site:/srv/jekyll/_site" \
        --volume="$PWD/_bundle:/usr/local/bundle" \
        jekyll/jekyll:$JEKYLL_VERSION \
        bundle update
}

case $1 in
run)
    run
    ;;
update)
    update
    ;;
*)
    echo "Usage: $0 run | update | new"
    ;;
esac
