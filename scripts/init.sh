#!/bin/bash

init(){
if [ $# -eq 0 ]
then 
    VERSION="debug"
else
    VERSION=$1
fi 

docker build -t chat-app-image:$VERSION -f thin.dockerfile .
docker run -it -p 8000:5000  -v ./rooms/:/rooms/ -v ./docs/:/app/docs/ --name chat-app-cont chat-app-image:$VERSION
}