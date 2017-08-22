#!/bin/bash

cd "${0%/*}"

WEBAPP=$1

if [ ! -f ./$1 ]; then
    echo -e "File not found!  You can deploy the following webapps:\n"

    for i in *.war; do
        [ -f "$i" ] || break
        echo ${i}
    done
    exit
fi

docker cp "$1" app_tomcat:/usr/local/tomcat/webapps/

echo $1" has been deployed"