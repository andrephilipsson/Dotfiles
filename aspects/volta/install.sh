#!/bin/sh

if ! command -v volta &> /dev/null; then
  echo "Missing volta, please install it first"
  exit 1
fi

volta install \
  node \
  yarn \
  pnpm \
