#!/bin/bash

if [[ $1 == "build" ]]; then
	docker build -f sfreact.dockerfile .
elif [[ $1 == "run" ]]; then
	docker-compose -f docker-compose.yml down
	docker-compose -f docker-compose.yml up -d
fi
