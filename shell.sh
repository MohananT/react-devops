#!/bin/bash

REGISTRY="registry"
REGISTRY_IMAGE="registry:2"
PORT=5000
FLAG=0


if [ "$(docker ps -q -f name=${REGISTRY})" ]; then
    echo "${REGISTRY} is running at ${PORT}"
    FLAG=1
else
    if [ "$(docker ps -aq -f name=${REGISTRY})" ]; then
	echo "starting registry ${REGISTRY}"
	docker start ${REGISTRY}
    else
	echo "run registry"
	docker run -p ${PORT}:${PORT} --name ${REGISTRY} ${REGISTRY_IMAGE}
    fi
fi

if [ "${FLAG}" -eq 0 ]; then
    if [ "$(docker ps -q -f name=${REGISTRY})" ]; then
	echo "registry running at port ${PORT}"
    else
	echo "registry not running"
	exit 1
    fi
fi
