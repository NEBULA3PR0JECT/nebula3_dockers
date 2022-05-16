#!/bin/bash
export SHELL=/bin/bash
rm -rf /storage/lost+found
export PYTHONPATH=/notebooks/:/nebula/nebula3_database
if  [ ! -d "/notebooks" ]
then
    mkdir /notebooks
fi
cd /notebooks
if [ ! -d "/notebooks/conda" ]
then
    curl -o ~/miniconda.sh -O  https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
    chmod +x ~/miniconda.sh && \
    ~/miniconda.sh -b -p /notebooks/conda && \
    rm ~/miniconda.sh && \
    /notebooks/conda/bin/conda install conda-build
fi
source activate nebula
chmod -R a+w /notebooks
jupyter lab --ip=0.0.0.0 --no-browser --allow-root --LabApp.trust_xheaders=True --LabApp.disable_check_xsrf=False --LabApp.allow_remote_access=True --LabApp.allow_origin='*'
