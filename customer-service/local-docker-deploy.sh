#!/bin/bash

docker kill customer-service
docker rm customer-service

# skipping unit tests for now...
./mvnw clean install -Dmaven.test.skip=true

docker build -t customer-service .

# assumed mysql docker container already started up before development...
docker run --name customer-service -d -t --link customer-db-mysql:mysql -p 8080:8080 customer-service
