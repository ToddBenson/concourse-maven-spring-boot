#! /bin/bash
Xvfb :99 -ac &
export DISPLAY=:99
export GRADLE_OPTS=-Dorg.gradle.native=false
cd ../security-tests
./gradlew test -Dcucumber.options="--tags @acceptance"
if [ $? -eq 0 ]
then
  echo "Tests Passed"
  pkill Xvfb
  exit 0
else
  echo "Tests Failed"
  pkill Xvfb
  exit 1
fi