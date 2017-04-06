#!/bin/bash
cd git-repo
retire --path . --outputformat text --outputpath retire.txt
eslint -c /opt/configs/static/.eslintrc --debug . -o ./eslint.txt
./mvnw clean install findbugs:findbugs
cat *.txt;sonar-scanner -Dsonar.host.url=http://10.37.128.36:9000 -Dsonar.projectKey=my:project -Dsonar.projectName=concourse-maven-spring-boot -Dsonar.projectVersion=1.0 -Dsonar.sources=./src/main/java/hello -Dsonar.java.binaries=./target/classes -Dsonar.github.repository=ToddBenson/concourse-maven-spring-boot -Dsonar.github.oauth=6a593e9cfef6d81e66f8da0577510ca69c8694f2 -Dsonar.login=607632a7d4379a3b1369f5a123bae8f87ddc83b1
