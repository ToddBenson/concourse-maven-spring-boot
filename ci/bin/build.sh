#!/bin/bash
pwd
ls
./mvnw clean install
cp ./target/*.war ../release