#!/bin/bash
deploy(){
VERSION=$1
COMMIT_HASH=$2
# Error handling must get 2 inputs from user
if [ $# -ne 2 ]
then
    echo "USAGE: $0 '<version>' '<commit-hash>'"
    exit 1
fi

# Tag & Build thin.dockerfile
docker build -t "bestpracticeimg:$VERSION"  -f thin.dockerfile .

# Error handling: Checks if build is completed succefuly
if [ $? -eq 0 ]
then
    # Tag & push commit hash
    git tag "v$VERSION" $COMMIT_HASH
    git push -u origin "v$VERSION" 
else
    echo "Error: Build failed, Fix dockerfile and try again"
fi

}