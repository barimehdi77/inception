#!/bin/sh

docker-compose down -v
docker-compose up --build -d
