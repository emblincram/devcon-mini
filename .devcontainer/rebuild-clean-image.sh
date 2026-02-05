#!/bin/bash

# SPDX-License-Identifier: MIT
# SPDX-Author: Roman Koch <koch.romam@gmail.com>
# SPDX-Copyright: 2025 Roman Koch <koch.romam@gmail.com>

set -euo pipefail

DATE_TAG=$(date +%Y%m%d-%H%M)
CR_PAT=$GITHUB_TOKEN
ORGANISATION="emblincram"
CONTAINER_NAME=basename $(git rev-parse --show-toplevel)

if [[ -z "${GITHUB_TOKEN:-}" ]]; then
        echo "error: GITHUB_TOKEN is not set." >&2
        exit 1
fi

docker build \
        -t ghcr.io/$ORGANISATION/$CONTAINER_NAME-clean:latest \
        -t ghcr.io/$ORGANISATION/$CONTAINER_NAME-clean:$DATE_TAG \
        -f CleanDockerfile .
echo "${CR_PAT}" | docker login ghcr.io -u "${ORGANISATION}" --password-stdin
docker push ghcr.io/$ORGANISATION/$CONTAINER_NAME-clean:latest
docker push ghcr.io/$ORGANISATION/$CONTAINER_NAME-clean:$DATE_TAG
