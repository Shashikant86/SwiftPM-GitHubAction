#!/bin/sh -l


sh -c "docker-compose build"
sh -c "docker-compose up"
sh -c "docker-compose down"
