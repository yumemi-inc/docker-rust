#!/usr/bin/env sh

IMAGE_NAME=ghcr.io/yumemi-inc/rust
PLATFORMS=linux/arm64/v8,linux/amd64
RUST_VERSION_MAJOR=1
RUST_VERSION_MINOR=68
RUST_VERSION_PATCH=0

RUST_VERSION_3="$RUST_VERSION_MAJOR.$RUST_VERSION_MINOR.$RUST_VERSION_PATCH"
RUST_VERSION_2="$RUST_VERSION_MAJOR.$RUST_VERSION_MINOR"
RUST_VERSION_1="$RUST_VERSION_MAJOR"

docker buildx build --push \
  --platform "$PLATFORMS" \
  --tag "$IMAGE_NAME:$RUST_VERSION_3-bookworm-mold" \
  --tag "$IMAGE_NAME:$RUST_VERSION_3-mold" \
  --tag "$IMAGE_NAME:$RUST_VERSION_2-bookworm-mold" \
  --tag "$IMAGE_NAME:$RUST_VERSION_2-mold" \
  --tag "$IMAGE_NAME:$RUST_VERSION_1-bookworm-mold" \
  --tag "$IMAGE_NAME:$RUST_VERSION_1-mold" \
  --tag "$IMAGE_NAME:bookworm-mold" \
  --tag "$IMAGE_NAME:mold" \
  "./$RUST_VERSION_3/bookworm/mold"

docker buildx build --push \
  --platform "$PLATFORMS" \
  --tag "$IMAGE_NAME:$RUST_VERSION_3-slim-bookworm-mold" \
  --tag "$IMAGE_NAME:$RUST_VERSION_3-slim-mold" \
  --tag "$IMAGE_NAME:$RUST_VERSION_2-slim-bookworm-mold" \
  --tag "$IMAGE_NAME:$RUST_VERSION_2-slim-mold" \
  --tag "$IMAGE_NAME:$RUST_VERSION_1-slim-bookworm-mold" \
  --tag "$IMAGE_NAME:$RUST_VERSION_1-slim-mold" \
  --tag "$IMAGE_NAME:slim-bookworm-mold" \
  --tag "$IMAGE_NAME:slim-mold" \
  "./$RUST_VERSION_3/bookworm/slim/mold"
