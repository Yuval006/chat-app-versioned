#!/bin/bash
delete(){
if [ $# -eq 0 ]
then 
    VERSION="debug"
else
    VERSION=$1
fi 

docker rmi -f chat-app-image:$VERSION
docker rm -f chat-app-cont
}