#!/bin/bash

if docker service ps "$WERCKER_DOCKER_SWARM_SERVICE" ; then
    docker service update --detach=false --update-order=start-first --update-failure-action=rollback --rollback-order=start-first --with-registry-auth --image "$WERCKER_DOCKER_SWARM_IMAGE:$WERCKER_DOCKER_SWARM_TAG" "$WERCKER_DOCKER_SWARM_SERVICE"
else
    echo please deploy service/stack:
    echo "$WERCKER_DOCKER_SWARM_IMAGE:$WERCKER_DOCKER_SWARM_TAG"
fi
