#!/bin/bash

# SPDX-License-Identifier: MIT
# SPDX-Author: Roman Koch <koch.romam@gmail.com>
# SPDX-Copyright: 2025 Roman Koch <koch.romam@gmail.com>

set -euo pipefail

DATE_TAG=$(date +%Y%m%d-%H%M)
CR_PAT=$GITHUB_TOKEN
ORGANISATION="emblincram"
REPO_ROOT=$(git rev-parse --show-toplevel)
CONTAINER_NAME=$(basename "$REPO_ROOT")

if [[ -z "${GITHUB_TOKEN:-}" ]]; then
    echo "error: GITHUB_TOKEN is not set." >&2
    exit 1
fi

docker build \
        -t ghcr.io/$ORGANISATION/$CONTAINER_NAME:latest \
        -t ghcr.io/$ORGANISATION/$CONTAINER_NAME:$DATE_TAG \
        -f "$REPO_ROOT/.devcontainer/Dockerfile" "$REPO_ROOT"

echo "${CR_PAT}" | docker login ghcr.io -u "${ORGANISATION}" --password-stdin
docker push ghcr.io/$ORGANISATION/$CONTAINER_NAME:latest
docker push ghcr.io/$ORGANISATION/$CONTAINER_NAME:$DATE_TAG
