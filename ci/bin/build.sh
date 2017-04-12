#!/bin/bash
./mvnw clean install
#/bin/cp ./target/*.war ../release

#!/bin/sh

set -e # fail fast
set -x # print commands

git clone deploy-file release

cp ./target/*.war ../release
cd ../release


git config --global user.email "nobody@concourse.ci"
git config --global user.name "Concourse"

git add .
git commit -m "Bumped date"