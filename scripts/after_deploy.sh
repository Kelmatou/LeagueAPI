#!/usr/bin/env bash

RELEASE_VERSION="$1"

if [ "$RELEASE_VERSION" != "" ]; then
  echo "Version $RELEASE_VERSION deployed!"
  echo "Mail notification should come later"
  exit 0
else
  echo "Version was not specified."
  exit 1
fi
