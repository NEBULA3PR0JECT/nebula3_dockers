#!/bin/bash
if  [ ! -d "/notebooks" ]
then
    mkdir /notebooks
fi
chown -R nebula:nebula /notebooks
if  [ ! -d "/storage/models" ]
then
    mkdir -p /storage/models
fi
chmod 777 /storage/models
chmod -R a+w /notebooks
su nebula -c '/dev_run.sh'
