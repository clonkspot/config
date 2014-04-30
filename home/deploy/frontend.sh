#!/bin/bash

. ~/env.sh

echo Updating repository...
cd ~/deploy/frontend/
# Save current commit
original=$(git rev-parse HEAD)
git fetch

echo Updating files...
git reset --hard origin/master

echo Updating dependencies...
npm install

echo Runing tests...
~/bin/mocha --reporter spec --no-colors 2>&1 || {
  echo Tests failed, reverting...
  git reset --hard $original
}

echo Generating files...
~/bin/grunt
~/bin/grunt layout

echo Copying static files...
cp -r public/* ~/html

echo Uglifying JS...
for file in ~/html/js/*.js; do
  ~/bin/uglifyjs $file -c -m -o $file
done

echo Restarting the server...
svc -du ~/service/frontend
