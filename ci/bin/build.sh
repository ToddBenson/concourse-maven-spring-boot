#!/bin/bash
pwd
ls -l
./mvnw -f git-repo/pom.xml clean install
cp ./target/*.war ../release