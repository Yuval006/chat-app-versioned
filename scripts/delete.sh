#!/bin/bash
delete(){
if [ $# -eq 0 ]
then 
    VERSION="debug"
else
    VERSION=$1
fi 

docker rmi -f bestpracticeimg:$VERSION
docker rm -f bestpracticecont
}