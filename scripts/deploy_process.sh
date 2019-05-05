#!/usr/bin/env bash

echo "Getting tag"
if [ "$TRAVIS_TAG" != "" ]; then
  echo "   Tag found ($TRAVIS_TAG)"
else
  echo "   Tag not found"
  exit 1
fi

EXIT_CODE=0

echo "Step 1/3 Before deploy"
./scripts/before_deploy.sh "$TRAVIS_TAG"
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
  exit $EXIT_CODE
fi

echo "Step 2/3 Deploy"
./scripts/deploy.sh "$TRAVIS_TAG"
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
  exit $EXIT_CODE
fi

echo "Step 3/3 After deploy"
./scripts/after_deploy.sh "$TRAVIS_TAG"
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
  exit $EXIT_CODE
fi

exit 0
