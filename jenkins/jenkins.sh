#!/bin/bash
docker network create --subnet=172.68.0.0/24 jenkins

docker container stop jenkins
docker container rm jenkins

docker build . -t devops_jenkins:1

docker run \
    -v /tmp/jenkins/home:/var/jenkins_home \
    --net jenkins --ip 172.68.0.10 \
    --detach \
    --name devops_jenkins devops_jenkins:1