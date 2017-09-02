#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

(
    cd "$DIR/.."

    docker build -f docker/base_image.dock \
        -t leksah-base \
        ./docker
)