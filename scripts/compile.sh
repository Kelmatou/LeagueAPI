#!/usr/bin/env bash

set -o pipefail # Without this, xcpretty will not return xcodebuild result
xcodebuild -project "$XCODEPROJ" -scheme "$SCHEME" | xcpretty
