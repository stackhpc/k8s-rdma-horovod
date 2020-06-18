set -x
TAG=0.19.3-tf2.1.0-torch-mxnet1.6.0-py3.6-gpu
HUB=stackhpc/horovod
docker build -t $HUB:$TAG --build-arg tag=$TAG . && docker push $HUB:$TAG
