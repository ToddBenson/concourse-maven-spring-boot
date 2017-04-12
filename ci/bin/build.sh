#!/bin/bash
pwd
ls -l
./mvnw -f clean install
cp ./target/*.war ../release