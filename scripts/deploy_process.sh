#!/usr/bin/env bash

OLD_GIT_TAG="$(git tag -l --contains HEAD)"
GIT_TAG="$TRAVIS_TAG"
echo "OLD_GIT_TAG $OLD_GIT_TAG"
echo "GIT_TAG $GIT_TAG"

echo "Getting git tag"
if [ "$GIT_TAG" != "" ]; then
  echo "   Git tag found ($GIT_TAG)"
else
  echo "   Git tag not found"
  exit 1
fi

EXIT_CODE=0

echo "Step 1/3 Before deploy"
./scripts/before_deploy.sh "$GIT_TAG"
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
  exit $EXIT_CODE
fi

echo "Step 2/3 Deploy"
./scripts/deploy.sh "$GIT_TAG"
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
  exit $EXIT_CODE
fi

echo "Step 3/3 After deploy"
./scripts/after_deploy.sh "$GIT_TAG"
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
  exit $EXIT_CODE
fi

exit 0
