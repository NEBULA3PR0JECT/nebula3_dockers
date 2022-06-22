#!/bin/bash
export SHELL=/bin/bash
rm -rf /storage/lost+found
export PYTHONPATH=/notebooks/
export PATH=$PATH:/opt/conda/bin
export TRANSFORMERS_CACHE=/nonetbooks/models
if  [ ! -d "/notebooks" ]
then
    mkdir /notebooks
fi
if  [ ! -d "/storage/models" ]
then
    mkdir -p /storage/models
fi
chmod -R a+w /notebooks
if [ -z "$JUPYTER_TOKEN" ]; then
    source activate base
    JUPYTER_TOKEN=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 48 | head -n 1)
fi
if [ "$1" = "code" ]
then
# Note: print mocked jupyter token so that we can run this container as if it is a notebook within Gradient V1
   echo "http://localhost:8888/?token=${JUPYTER_TOKEN}"
   echo "http://localhost:8888/\?token\=${JUPYTER_TOKEN}"
   export XDG_DATA_HOME=/notebooks
   PASSWORD=${JUPYTER_TOKEN} /usr/bin/code-server --bind-addr "0.0.0.0:8888" .
else
   jupyter lab --ip=0.0.0.0 --no-browser --allow-root --LabApp.trust_xheaders=True --LabApp.disable_check_xsrf=False --LabApp.allow_remote_access=True --LabApp.allow_origin='*'
fi
