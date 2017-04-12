#!/bin/bash
#./mvnw clean install
#/bin/cp ./target/*.war ../release

set -e # fail fast
set -x # print commands

git clone deploy-file release
cd git-repo
./mvnw clean install
cp ./target/*.war ../release
cd ../release


git config --global user.email "todd.benson@csaa.com"
git config --global user.name "Concourse"

git add .
git commit -m "Bumped date"