apt-key del 7fa2af80
wget https://developer.download.nvidia.com/compute/cuda/repos/$distro/$arch/cuda-keyring_1.0-1_all.deb
dpkg -i cuda-keyring_1.0-1_all.deb
apt update
apt install lsof

# conda install pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch
which pip
which conda
# pip install -U pip setuptools wheel
# pip install -U 'spacy[cuda112]'
python -m spacy download en_core_web_sm

# conda install -c conda-forge cudatoolkit-dev -y
# HOROVOD_GPU_ALLREDUCE=NCCL HOROVOD_NCCL_LINK=SHARED HOROVOD_WITH_PYTORCH=1 HOROVOD_GPU_OPERATIONS=NCCL
# pip install --no-cache-dir horovod -y
HOROVOD_GPU_ALLREDUCE=NCCL HOROVOD_NCCL_LINK=SHARED HOROVOD_WITH_PYTORCH=1 \
    pip install --no-cache-dir horovod==0.19.4 &&\
    ldconfig

# pip uninstall pillow -y && \
# CC="cc -mavx2" pip install -U --force-reinstall pillow-simd

pip install -r requirements.txt

# git clone https://github.com/NVIDIA/apex.git &&\
cd apex &&\
pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" .

