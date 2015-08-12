#!/bin/bash
set -e
source $ROOT/build-tools/build_funcs.sh
if [[ -z "$IMAGE" ]]; then
    export IMAGE=ubuntu
fi
build $@
