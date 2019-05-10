RELEASE_VERSION="$1"

echo "Preparing release..."
if [ "$RELEASE_VERSION" != "" ]; then
  echo "   Version tag found"
else
  echo "   Version tag was not found."
  exit 1
fi

echo "Checking tag $RELEASE_VERSION"
if [[ "$RELEASE_VERSION" =~ ^([0-9])+.([0-9])+.([0-9])+$ ]]; then
  echo "   Version tag is valid"
else
  echo "   Version tag is not valid."
  echo "   Version must respect format X.X.X"
  exit 2
fi

echo "Verifying project version"
FILES_NEED_UPDATE="FALSE"

grep -q "$RELEASE_VERSION" ./LeagueAPI.podspec
if [ $? -ne 0 ]; then
  echo "   Version $RELEASE_VERSION was not updated in LeagueAPI.podspec"
  FILES_NEED_UPDATE="TRUE"
fi

grep -q "$RELEASE_VERSION" ./LeagueAPI/LeagueAPI/Info.plist
if [ $? -ne 0 ]; then
  echo "   Version $RELEASE_VERSION was not updated in iOS Info.plist"
  FILES_NEED_UPDATE="TRUE"
fi

grep -q "$RELEASE_VERSION" ./LeagueAPI/LeagueAPI-TvOS/Info.plist
if [ $? -ne 0 ]; then
  echo "   Version $RELEASE_VERSION was not updated in TvOS Info.plist"
  FILES_NEED_UPDATE="TRUE"
fi

grep -q "$RELEASE_VERSION" ./LeagueAPI/LeagueAPI-WatchOS/Info.plist
if [ $? -ne 0 ]; then
  echo "   Version $RELEASE_VERSION was not updated in WatchOS Info.plist"
  FILES_NEED_UPDATE="TRUE"
fi

grep -q "$RELEASE_VERSION" ./LeagueAPI/LeagueAPI-MacOS/Info.plist
if [ $? -ne 0 ]; then
  echo "   Version $RELEASE_VERSION was not updated in MacOS Info.plist"
  FILES_NEED_UPDATE="TRUE"
fi

if [ "$FILES_NEED_UPDATE" = "FALSE" ]; then
  echo "   All files were updated with $RELEASE_VERSION"
else
  exit 3
fi

echo "Checking pod lib lint"
echo "   Setting ruby"
source ~/.rvm/scripts/rvm
rvm use default
echo "   Running pod lib lint"
pod lib lint
if [ $? -eq 0 ]; then
  echo "   pod lib lint was successful"
else
  echo "   pod lib lint failed"
  exit 4
fi

echo "LeagueAPI ($RELEASE_VERSION) is ready to be deployed!"
exit 0
