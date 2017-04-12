#!/bin/bash
retire --path . --outputformat text --outputpath retire.txt
eslint -c /opt/compliance-toolkit/static/.eslintrc --debug . -o ./eslint.txt
../../mvnw clean install findbugs:findbugs
cat *.txt
sonar-scanner -Dsonar.host.url=$SONAR_URL -Dsonar.projectKey=$SONAR_PROJECT_KEY -Dsonar.projectName=$SONAR_PROJECT_NAME -Dsonar.projectVersion=$SONAR_PROJECT_VERSION -Dsonar.sources=$SONAR_SOURCES -Dsonar.java.binaries=$SONAR_JAVA_BINARIES -Dsonar.github.repository=$REPO -Dsonar.github.oauth=$GIT_REPO_TOKEN -Dsonar.login=$SONAR_TOKEN
