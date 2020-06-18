ARG tag=latest
FROM horovod/horovod:${tag}
RUN apt install -y iproute2 iputils-ping
COPY examples/ /examples/
