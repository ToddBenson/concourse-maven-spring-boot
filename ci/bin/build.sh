#!/bin/bash
./mvnw clean install
/bin/cp ./target/*.war ../release
