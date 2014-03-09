#!/bin/bash

. ~/env.sh

echo Updating repository...
cd ~/deploy/backend/
# Save current commit
original=$(git rev-parse HEAD)
git fetch

echo Updating files...
git reset --hard origin/master

echo Updating dependencies...
npm install

echo Restarting the server...
svc -du ~/service/backend
