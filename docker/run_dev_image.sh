#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

$DIR/build_base_image.sh

(
    cd "$DIR/.."

    container_id=$(
        docker run -it -d --rm \
            -v "$DIR/../leksah":/home/developer/leksah \
            -v "$DIR/../stack":/home/developer/.stack \
            -v "$DIR/../local":/home/developer/.local \
            -v "/home/nickolay/workspace/Haskell":/home/developer/workspace \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -e DISPLAY=$DISPLAY \
            leksah-base
    )

    cat - <<EOF
/*----------------------------------------------------------------
| Your Leksah development environment is running in container:
| $container_id
| This container will be removed upon exit
|-----------------------------------------------------------------
| Press ENTER to get into the bash prompt for the container
\*----------------------------------------------------------------
EOF

    docker attach $container_id
)