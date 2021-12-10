#!/bin/bash

echo $HOME
rm -rf $HOME/data
mkdir -p $HOME/data/db-data
mkdir -p $HOME/data/www-data
sudo docker-compose down -v
sudo docker-compose up --build
