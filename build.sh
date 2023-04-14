#!/bin/bash

set -x

UBUNTU_VERSION=${UBUNTU_VERSION:-22.04}
podman build \
       -t hwkit-toolbox:$UBUNTU_VERSION  \
       --build-arg=UBUNTU_VERSION=$UBUNTU_VERSION \
       --build-arg=BUILD_DATE="$(date  --rfc-3339=seconds)" \
       --build-arg VCS_REF="$(git rev-parse HEAD)" \
       .
