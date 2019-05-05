#!/usr/bin/env bash

RELEASE_VERSION="$1"

if [ "$RELEASE_VERSION" != "" ]; then
  echo "Deploying $RELEASE_VERSION"
else
  echo "Version was not specified."
  exit 1
fi

echo "Setting ruby"
source ~/.rvm/scripts/rvm
rvm use default

echo "Deploying LeagueAPI ($RELEASE_VERSION) to cocoapod"
pod trunk push

if [ $? -eq 0 ]; then
  echo "LeagueAPI ($RELEASE_VERSION) is now deployed on cocoapod!"
  exit 0
else
  echo "   Failed to deploy on cocoapod"
  exit 2
fi
