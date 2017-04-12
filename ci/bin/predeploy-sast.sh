#!/bin/bash
retire --path . --outputformat text --outputpath retire.txt
eslint -c /opt/compliance-toolkit/config/static/.eslintrc --debug . -o ./eslint.txt
./mvnw clean install dependency-check:check
sonar-scanner -Dsonar.host.url=$SONAR_URL -Dsonar.projectKey=$SONAR_PROJECT_KEY -Dsonar.projectName=$SONAR_PROJECT_NAME -Dsonar.projectVersion=$SONAR_PROJECT_VERSION -Dsonar.sources=$SONAR_SOURCES -Dsonar.java.binaries=$SONAR_JAVA_BINARIES -Dsonar.github.repository=$REPO -Dsonar.github.oauth=$GIT_REPO_TOKEN -Dsonar.login=$SONAR_TOKEN -Dsonar.dependencyCheck.reportPath=target/dependency-check-report.xml
cat *.txt
