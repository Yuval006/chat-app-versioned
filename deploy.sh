#!/bin/bash

VERSION=$1
COMMIT_HASH=$2
docker build -t "bestpracticeimg:$VERSION" .

git tag "v$VERSION" $COMMIT_HASH

git push origin "v$VERSION" 

