# Requirements

- Kubernetes cluster v1.18.x minimum
- IB/RoCE virtual functions
- Nvidia GPUs

# Instructions

    git clone --recurse-submodules git@github.com:stackhpc/k8s-rdma-horovod.git
    cd k8s-rdma-horovod/
    helm upgrade --install tf2 -f values.yaml charts/stable/horovod/

    kubectl get pods
    NAME                READY   STATUS              RESTARTS   AGE
    tf2-horovod-0       0/1     ContainerCreating   0          3s
    tf2-horovod-1       0/1     ContainerCreating   0          3s
    tf2-horovod-2       0/1     ContainerCreating   0          3s
    tf2-horovod-3       0/1     ContainerCreating   0          3s
    tf2-horovod-4       0/1     ContainerCreating   0          3s
    tf2-horovod-5       0/1     ContainerCreating   0          3s
    tf2-horovod-6       0/1     ContainerCreating   0          3s
    tf2-horovod-6clzb   0/1     Init:0/1            0          3s

# Results

## RoCE

    kubectl logs job/tf2-horovod
    + sleep 5
    + mkdir -p /root/.ssh
    + rm -f /root/.ssh/config
    + touch /root/.ssh/config
    + '[' true == true ']'
    + set +e
    + yes
    + cp /etc/secret-volume/id_rsa /root/.ssh/id_rsa
    + yes
    + cp /etc/secret-volume/authorized_keys /root/.ssh/authorized_keys
    + set -e
    + '[' -n 22 ']'
    + echo 'Port 22'
    + sed -i 's/^Port.*/Port 22 /g' /etc/ssh/sshd_config
    + echo 'StrictHostKeyChecking no'
    + /usr/sbin/sshd
    + '[' 1 -eq 0 ']'
    + bash -c 'mpirun -np 8 -x NCCL_DEBUG=INFO -x PATH -x LD_LIBRARY_PATH -x HOROVOD_MPI_THREADS_DISABLE=1 -bind-to none -map-by slot -mca pml ob1 --hostfile /horovod/generated/hostfile --mca orte_keep_fqdn_hostnames t --allow-run-as-root --display-map --tag-output --timestamp-output sh -c '\''python /examples/tensorflow2_synthetic_benchmark.py'\'''
    Warning: Permanently added 'tf2-horovod-3.tf2-horovod,10.233.99.246' (ECDSA) to the list of known hosts.
    Warning: Permanently added 'tf2-horovod-4.tf2-horovod,10.233.99.248' (ECDSA) to the list of known hosts.
    Warning: Permanently added 'tf2-horovod-1.tf2-horovod,10.233.99.247' (ECDSA) to the list of known hosts.
    Warning: Permanently added 'tf2-horovod-0.tf2-horovod,10.233.64.78' (ECDSA) to the list of known hosts.
    Warning: Permanently added 'tf2-horovod-6.tf2-horovod,10.233.64.80' (ECDSA) to the list of known hosts.
    Warning: Permanently added 'tf2-horovod-5.tf2-horovod,10.233.64.81' (ECDSA) to the list of known hosts.
    Warning: Permanently added 'tf2-horovod-2.tf2-horovod,10.233.64.79' (ECDSA) to the list of known hosts.
     Data for JOB [59809,1] offset 0 Total slots allocated 8
    
     ========================   JOB MAP   ========================
    
     Data for node: tf2-horovod-6clzb    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 0 Bound: N/A
    
     Data for node: tf2-horovod-0.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 1 Bound: N/A
    
     Data for node: tf2-horovod-1.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 2 Bound: N/A
    
     Data for node: tf2-horovod-2.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 3 Bound: N/A
    
     Data for node: tf2-horovod-3.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 4 Bound: N/A
    
     Data for node: tf2-horovod-4.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 5 Bound: N/A
    
     Data for node: tf2-horovod-5.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 6 Bound: N/A
    
     Data for node: tf2-horovod-6.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 7 Bound: N/A
    
     =============================================================
     Data for JOB [59809,1] offset 0 Total slots allocated 8
    
     ========================   JOB MAP   ========================
    
     Data for node: tf2-horovod-6clzb    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 0 Bound: N/A
    
     Data for node: tf2-horovod-0.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 1 Bound: N/A
    
     Data for node: tf2-horovod-1.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 2 Bound: N/A
    
     Data for node: tf2-horovod-2.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 3 Bound: N/A
    
     Data for node: tf2-horovod-3.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 4 Bound: N/A
    
     Data for node: tf2-horovod-4.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 5 Bound: N/A
    
     Data for node: tf2-horovod-5.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 6 Bound: N/A
    
     Data for node: tf2-horovod-6.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 7 Bound: N/A
    
     =============================================================
     Data for JOB [59809,1] offset 0 Total slots allocated 8
     Data for JOB [59809,1] offset 0 Total slots allocated 8
    
     ========================   JOB MAP   ========================
    
     Data for node: tf2-horovod-6clzb    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 0 Bound: N/A
    
     Data for node: tf2-horovod-0.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 1 Bound: N/A
    
     Data for node: tf2-horovod-1.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 2 Bound: N/A
    
     Data for node: tf2-horovod-2.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 3 Bound: N/A
    
     Data for node: tf2-horovod-3.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 4 Bound: N/A
    
     Data for node: tf2-horovod-4.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 5 Bound: N/A
    
     Data for node: tf2-horovod-5.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 6 Bound: N/A
    
     Data for node: tf2-horovod-6.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 7 Bound: N/A
    
     =============================================================
    
     ========================   JOB MAP   ========================
    
     Data for node: tf2-horovod-6clzb    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 0 Bound: N/A
    
     Data for node: tf2-horovod-0.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 1 Bound: N/A
    
     Data for node: tf2-horovod-1.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 2 Bound: N/A
    
     Data for node: tf2-horovod-2.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 3 Bound: N/A
    
     Data for node: tf2-horovod-3.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 4 Bound: N/A
    
     Data for node: tf2-horovod-4.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 5 Bound: N/A
    
     Data for node: tf2-horovod-5.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 6 Bound: N/A
    
     Data for node: tf2-horovod-6.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 7 Bound: N/A
    
     =============================================================
     Data for JOB [59809,1] offset 0 Total slots allocated 8
     Data for JOB [59809,1] offset 0 Total slots allocated 8
    
     ========================   JOB MAP   ========================
    
     Data for node: tf2-horovod-6clzb    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 0 Bound: N/A
    
     Data for node: tf2-horovod-0.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 1 Bound: N/A
    
     Data for node: tf2-horovod-1.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 2 Bound: N/A
    
     Data for node: tf2-horovod-2.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 3 Bound: N/A
    
     Data for node: tf2-horovod-3.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 4 Bound: N/A
    
     Data for node: tf2-horovod-4.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 5 Bound: N/A
    
     Data for node: tf2-horovod-5.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 6 Bound: N/A
    
     Data for node: tf2-horovod-6.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 7 Bound: N/A
    
     =============================================================
     Data for JOB [59809,1] offset 0 Total slots allocated 8
    
     ========================   JOB MAP   ========================
    
     Data for node: tf2-horovod-6clzb    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 0 Bound: N/A
    
     Data for node: tf2-horovod-0.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 1 Bound: N/A
    
     Data for node: tf2-horovod-1.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 2 Bound: N/A
    
     Data for node: tf2-horovod-2.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 3 Bound: N/A
    
     Data for node: tf2-horovod-3.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 4 Bound: N/A
    
     Data for node: tf2-horovod-4.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 5 Bound: N/A
    
     Data for node: tf2-horovod-5.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 6 Bound: N/A
    
     Data for node: tf2-horovod-6.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 7 Bound: N/A
    
     =============================================================
    
     ========================   JOB MAP   ========================
    
     Data for node: tf2-horovod-6clzb    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 0 Bound: N/A
    
     Data for node: tf2-horovod-0.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 1 Bound: N/A
    
     Data for node: tf2-horovod-1.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 2 Bound: N/A
    
     Data for node: tf2-horovod-2.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 3 Bound: N/A
    
     Data for node: tf2-horovod-3.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 4 Bound: N/A
    
     Data for node: tf2-horovod-4.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 5 Bound: N/A
    
     Data for node: tf2-horovod-5.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 6 Bound: N/A
    
     Data for node: tf2-horovod-6.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 7 Bound: N/A
    
     =============================================================
     Data for JOB [59809,1] offset 0 Total slots allocated 8
    
     ========================   JOB MAP   ========================
    
     Data for node: tf2-horovod-6clzb    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 0 Bound: N/A
    
     Data for node: tf2-horovod-0.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 1 Bound: N/A
    
     Data for node: tf2-horovod-1.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 2 Bound: N/A
    
     Data for node: tf2-horovod-2.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 3 Bound: N/A
    
     Data for node: tf2-horovod-3.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 4 Bound: N/A
    
     Data for node: tf2-horovod-4.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 5 Bound: N/A
    
     Data for node: tf2-horovod-5.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 6 Bound: N/A
    
     Data for node: tf2-horovod-6.tf2-horovod    Num slots: 1    Max slots: 0    Num procs: 1
         Process OMPI jobid: [59809,1] App: 0 Process rank: 7 Bound: N/A
    
     =============================================================
    Thu Jun 18 14:28:35 2020[1,2]<stderr>:2020-06-18 14:28:35.296902: W tensorflow/stream_executor/platform/default/dso_loader.cc:55] Could not load dynamic library 'libnvinfer.so.6'; dlerror: libnvinfer.so.6: cannot open shared object file: No such file or directory; LD_LIBRARY_PATH: /usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
    Thu Jun 18 14:28:35 2020[1,2]<stderr>:2020-06-18 14:28:35.297039: W tensorflow/stream_executor/platform/default/dso_loader.cc:55] Could not load dynamic library 'libnvinfer_plugin.so.6'; dlerror: libnvinfer_plugin.so.6: cannot open shared object file: No such file or directory; LD_LIBRARY_PATH: /usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
    Thu Jun 18 14:28:35 2020[1,2]<stderr>:2020-06-18 14:28:35.297052: W tensorflow/compiler/tf2tensorrt/utils/py_utils.cc:30] Cannot dlopen some TensorRT libraries. If you would like to use Nvidia GPU with TensorRT, please make sure the missing libraries mentioned above are installed properly.
    Thu Jun 18 14:28:35 2020[1,4]<stderr>:2020-06-18 14:28:35.304567: W tensorflow/stream_executor/platform/default/dso_loader.cc:55] Could not load dynamic library 'libnvinfer.so.6'; dlerror: libnvinfer.so.6: cannot open shared object file: No such file or directory; LD_LIBRARY_PATH: /usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
    Thu Jun 18 14:28:35 2020[1,5]<stderr>:2020-06-18 14:28:35.304567: W tensorflow/stream_executor/platform/default/dso_loader.cc:55] Could not load dynamic library 'libnvinfer.so.6'; dlerror: libnvinfer.so.6: cannot open shared object file: No such file or directory; LD_LIBRARY_PATH: /usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
    Thu Jun 18 14:28:35 2020[1,4]<stderr>:2020-06-18 14:28:35.304741: W tensorflow/stream_executor/platform/default/dso_loader.cc:55] Could not load dynamic library 'libnvinfer_plugin.so.6'; dlerror: libnvinfer_plugin.so.6: cannot open shared object file: No such file or directory; LD_LIBRARY_PATH: /usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
    Thu Jun 18 14:28:35 2020[1,5]<stderr>:2020-06-18 14:28:35.304740: W tensorflow/stream_executor/platform/default/dso_loader.cc:55] Could not load dynamic library 'libnvinfer_plugin.so.6'; dlerror: libnvinfer_plugin.so.6: cannot open shared object file: No such file or directory; LD_LIBRARY_PATH: /usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
    Thu Jun 18 14:28:35 2020[1,4]<stderr>:2020-06-18 14:28:35.304758: W tensorflow/compiler/tf2tensorrt/utils/py_utils.cc:30] Cannot dlopen some TensorRT libraries. If you would like to use Nvidia GPU with TensorRT, please make sure the missing libraries mentioned above are installed properly.
    Thu Jun 18 14:28:35 2020[1,5]<stderr>:2020-06-18 14:28:35.304755: W tensorflow/compiler/tf2tensorrt/utils/py_utils.cc:30] Cannot dlopen some TensorRT libraries. If you would like to use Nvidia GPU with TensorRT, please make sure the missing libraries mentioned above are installed properly.
    Thu Jun 18 14:28:35 2020[1,0]<stderr>:2020-06-18 14:28:35.310263: W tensorflow/stream_executor/platform/default/dso_loader.cc:55] Could not load dynamic library 'libnvinfer.so.6'; dlerror: libnvinfer.so.6: cannot open shared object file: No such file or directory; LD_LIBRARY_PATH: /usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
    Thu Jun 18 14:28:35 2020[1,0]<stderr>:2020-06-18 14:28:35.310398: W tensorflow/stream_executor/platform/default/dso_loader.cc:55] Could not load dynamic library 'libnvinfer_plugin.so.6'; dlerror: libnvinfer_plugin.so.6: cannot open shared object file: No such file or directory; LD_LIBRARY_PATH: /usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
    Thu Jun 18 14:28:35 2020[1,0]<stderr>:2020-06-18 14:28:35.310413: W tensorflow/compiler/tf2tensorrt/utils/py_utils.cc:30] Cannot dlopen some TensorRT libraries. If you would like to use Nvidia GPU with TensorRT, please make sure the missing libraries mentioned above are installed properly.
    Thu Jun 18 14:28:35 2020[1,1]<stderr>:2020-06-18 14:28:35.825829: W tensorflow/stream_executor/platform/default/dso_loader.cc:55] Could not load dynamic library 'libnvinfer.so.6'; dlerror: libnvinfer.so.6: cannot open shared object file: No such file or directory; LD_LIBRARY_PATH: /usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
    Thu Jun 18 14:28:35 2020[1,1]<stderr>:2020-06-18 14:28:35.825978: W tensorflow/stream_executor/platform/default/dso_loader.cc:55] Could not load dynamic library 'libnvinfer_plugin.so.6'; dlerror: libnvinfer_plugin.so.6: cannot open shared object file: No such file or directory; LD_LIBRARY_PATH: /usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
    Thu Jun 18 14:28:35 2020[1,1]<stderr>:2020-06-18 14:28:35.825992: W tensorflow/compiler/tf2tensorrt/utils/py_utils.cc:30] Cannot dlopen some TensorRT libraries. If you would like to use Nvidia GPU with TensorRT, please make sure the missing libraries mentioned above are installed properly.
    Thu Jun 18 14:28:36 2020[1,3]<stderr>:2020-06-18 14:28:36.005585: W tensorflow/stream_executor/platform/default/dso_loader.cc:55] Could not load dynamic library 'libnvinfer.so.6'; dlerror: libnvinfer.so.6: cannot open shared object file: No such file or directory; LD_LIBRARY_PATH: /usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
    Thu Jun 18 14:28:36 2020[1,3]<stderr>:2020-06-18 14:28:36.005788: W tensorflow/stream_executor/platform/default/dso_loader.cc:55] Could not load dynamic library 'libnvinfer_plugin.so.6'; dlerror: libnvinfer_plugin.so.6: cannot open shared object file: No such file or directory; LD_LIBRARY_PATH: /usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
    Thu Jun 18 14:28:36 2020[1,3]<stderr>:2020-06-18 14:28:36.005814: W tensorflow/compiler/tf2tensorrt/utils/py_utils.cc:30] Cannot dlopen some TensorRT libraries. If you would like to use Nvidia GPU with TensorRT, please make sure the missing libraries mentioned above are installed properly.
    Thu Jun 18 14:28:36 2020[1,6]<stderr>:2020-06-18 14:28:36.048289: W tensorflow/stream_executor/platform/default/dso_loader.cc:55] Could not load dynamic library 'libnvinfer.so.6'; dlerror: libnvinfer.so.6: cannot open shared object file: No such file or directory; LD_LIBRARY_PATH: /usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
    Thu Jun 18 14:28:36 2020[1,6]<stderr>:2020-06-18 14:28:36.048539: W tensorflow/stream_executor/platform/default/dso_loader.cc:55] Could not load dynamic library 'libnvinfer_plugin.so.6'; dlerror: libnvinfer_plugin.so.6: cannot open shared object file: No such file or directory; LD_LIBRARY_PATH: /usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
    Thu Jun 18 14:28:36 2020[1,6]<stderr>:2020-06-18 14:28:36.048570: W tensorflow/compiler/tf2tensorrt/utils/py_utils.cc:30] Cannot dlopen some TensorRT libraries. If you would like to use Nvidia GPU with TensorRT, please make sure the missing libraries mentioned above are installed properly.
    Thu Jun 18 14:28:36 2020[1,7]<stderr>:2020-06-18 14:28:36.257946: W tensorflow/stream_executor/platform/default/dso_loader.cc:55] Could not load dynamic library 'libnvinfer.so.6'; dlerror: libnvinfer.so.6: cannot open shared object file: No such file or directory; LD_LIBRARY_PATH: /usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
    Thu Jun 18 14:28:36 2020[1,7]<stderr>:2020-06-18 14:28:36.258172: W tensorflow/stream_executor/platform/default/dso_loader.cc:55] Could not load dynamic library 'libnvinfer_plugin.so.6'; dlerror: libnvinfer_plugin.so.6: cannot open shared object file: No such file or directory; LD_LIBRARY_PATH: /usr/local/lib:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
    Thu Jun 18 14:28:36 2020[1,7]<stderr>:2020-06-18 14:28:36.258199: W tensorflow/compiler/tf2tensorrt/utils/py_utils.cc:30] Cannot dlopen some TensorRT libraries. If you would like to use Nvidia GPU with TensorRT, please make sure the missing libraries mentioned above are installed properly.
    Thu Jun 18 14:28:37 2020[1,4]<stderr>:2020-06-18 14:28:37.565745: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcuda.so.1
    Thu Jun 18 14:28:37 2020[1,0]<stderr>:2020-06-18 14:28:37.565908: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcuda.so.1
    Thu Jun 18 14:28:37 2020[1,5]<stderr>:2020-06-18 14:28:37.565908: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcuda.so.1
    Thu Jun 18 14:28:37 2020[1,2]<stderr>:2020-06-18 14:28:37.565915: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcuda.so.1
    Thu Jun 18 14:28:37 2020[1,3]<stderr>:2020-06-18 14:28:37.566656: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcuda.so.1
    Thu Jun 18 14:28:37 2020[1,7]<stderr>:2020-06-18 14:28:37.566844: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcuda.so.1
    Thu Jun 18 14:28:37 2020[1,1]<stderr>:2020-06-18 14:28:37.567355: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcuda.so.1
    Thu Jun 18 14:28:37 2020[1,6]<stderr>:2020-06-18 14:28:37.567370: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcuda.so.1
    Thu Jun 18 14:28:37 2020[1,4]<stderr>:2020-06-18 14:28:37.652106: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1555] Found device 0 with properties: 
    Thu Jun 18 14:28:37 2020[1,4]<stderr>:pciBusID: 0000:05:00.0 name: Tesla P100-PCIE-12GB computeCapability: 6.0
    Thu Jun 18 14:28:37 2020[1,4]<stderr>:coreClock: 1.3285GHz coreCount: 56 deviceMemorySize: 11.91GiB deviceMemoryBandwidth: 511.41GiB/s
    Thu Jun 18 14:28:37 2020[1,4]<stderr>:2020-06-18 14:28:37.652206: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:37 2020[1,4]<stderr>:2020-06-18 14:28:37.654801: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:37 2020[1,4]<stderr>:2020-06-18 14:28:37.657340: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcufft.so.10
    Thu Jun 18 14:28:37 2020[1,4]<stderr>:2020-06-18 14:28:37.657783: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcurand.so.10
    Thu Jun 18 14:28:37 2020[1,4]<stderr>:2020-06-18 14:28:37.660540: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusolver.so.10
    Thu Jun 18 14:28:37 2020[1,4]<stderr>:2020-06-18 14:28:37.661998: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusparse.so.10
    Thu Jun 18 14:28:37 2020[1,4]<stderr>:2020-06-18 14:28:37.667428: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:37 2020[1,3]<stderr>:2020-06-18 14:28:37.682799: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1555] Found device 0 with properties: 
    Thu Jun 18 14:28:37 2020[1,3]<stderr>:pciBusID: 0000:05:00.0 name: Tesla P100-PCIE-12GB computeCapability: 6.0
    Thu Jun 18 14:28:37 2020[1,3]<stderr>:coreClock: 1.3285GHz coreCount: 56 deviceMemorySize: 11.91GiB deviceMemoryBandwidth: 511.41GiB/s
    Thu Jun 18 14:28:37 2020[1,3]<stderr>:2020-06-18 14:28:37.682919: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:37 2020[1,5]<stderr>:2020-06-18 14:28:37.686481: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1555] Found device 0 with properties: 
    Thu Jun 18 14:28:37 2020[1,5]<stderr>:pciBusID: 0000:85:00.0 name: Tesla P100-PCIE-12GB computeCapability: 6.0
    Thu Jun 18 14:28:37 2020[1,5]<stderr>:coreClock: 1.3285GHz coreCount: 56 deviceMemorySize: 11.91GiB deviceMemoryBandwidth: 511.41GiB/s
    Thu Jun 18 14:28:37 2020[1,5]<stderr>:2020-06-18 14:28:37.686553: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:37 2020[1,3]<stderr>:2020-06-18 14:28:37.688133: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:37 2020[1,5]<stderr>:2020-06-18 14:28:37.689124: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:37 2020[1,4]<stderr>:2020-06-18 14:28:37.691289: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1697] Adding visible gpu devices: 0
    Thu Jun 18 14:28:37 2020[1,5]<stderr>:2020-06-18 14:28:37.691780: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcufft.so.10
    Thu Jun 18 14:28:37 2020[1,5]<stderr>:2020-06-18 14:28:37.692193: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcurand.so.10
    Thu Jun 18 14:28:37 2020[1,3]<stderr>:2020-06-18 14:28:37.693223: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcufft.so.10
    Thu Jun 18 14:28:37 2020[1,5]<stderr>:2020-06-18 14:28:37.694894: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusolver.so.10
    Thu Jun 18 14:28:37 2020[1,3]<stderr>:2020-06-18 14:28:37.694044: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcurand.so.10
    Thu Jun 18 14:28:37 2020[1,5]<stderr>:2020-06-18 14:28:37.696306: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusparse.so.10
    Thu Jun 18 14:28:37 2020[1,3]<stderr>:2020-06-18 14:28:37.699490: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusolver.so.10
    Thu Jun 18 14:28:37 2020[1,5]<stderr>:2020-06-18 14:28:37.701658: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:37 2020[1,3]<stderr>:2020-06-18 14:28:37.702358: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusparse.so.10
    Thu Jun 18 14:28:37 2020[1,4]<stderr>:2020-06-18 14:28:37.709151: I tensorflow/core/platform/cpu_feature_guard.cc:142] Your CPU supports instructions that this TensorFlow binary was not compiled to use: AVX2 FMA
    Thu Jun 18 14:28:37 2020[1,3]<stderr>:2020-06-18 14:28:37.713121: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:37 2020[1,2]<stderr>:2020-06-18 14:28:37.719822: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1555] Found device 0 with properties: 
    Thu Jun 18 14:28:37 2020[1,2]<stderr>:pciBusID: 0000:04:00.0 name: Tesla P100-PCIE-12GB computeCapability: 6.0
    Thu Jun 18 14:28:37 2020[1,2]<stderr>:coreClock: 1.3285GHz coreCount: 56 deviceMemorySize: 11.91GiB deviceMemoryBandwidth: 511.41GiB/s
    Thu Jun 18 14:28:37 2020[1,2]<stderr>:2020-06-18 14:28:37.719908: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:37 2020[1,2]<stderr>:2020-06-18 14:28:37.722268: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:37 2020[1,4]<stderr>:2020-06-18 14:28:37.724005: I tensorflow/core/platform/profile_utils/cpu_utils.cc:94] CPU Frequency: 2100150000 Hz
    Thu Jun 18 14:28:37 2020[1,5]<stderr>:2020-06-18 14:28:37.724077: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1697] Adding visible gpu devices: 0
    Thu Jun 18 14:28:37 2020[1,2]<stderr>:2020-06-18 14:28:37.724620: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcufft.so.10
    Thu Jun 18 14:28:37 2020[1,2]<stderr>:2020-06-18 14:28:37.724993: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcurand.so.10
    Thu Jun 18 14:28:37 2020[1,2]<stderr>:2020-06-18 14:28:37.727521: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusolver.so.10
    Thu Jun 18 14:28:37 2020[1,2]<stderr>:2020-06-18 14:28:37.728838: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusparse.so.10
    Thu Jun 18 14:28:37 2020[1,0]<stderr>:2020-06-18 14:28:37.731080: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1555] Found device 0 with properties: 
    Thu Jun 18 14:28:37 2020[1,0]<stderr>:pciBusID: 0000:86:00.0 name: Tesla P100-PCIE-12GB computeCapability: 6.0
    Thu Jun 18 14:28:37 2020[1,0]<stderr>:coreClock: 1.3285GHz coreCount: 56 deviceMemorySize: 11.91GiB deviceMemoryBandwidth: 511.41GiB/s
    Thu Jun 18 14:28:37 2020[1,0]<stderr>:2020-06-18 14:28:37.731135: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:37 2020[1,4]<stderr>:2020-06-18 14:28:37.732057: I tensorflow/compiler/xla/service/service.cc:168] XLA service 0x3004660 initialized for platform Host (this does not guarantee that XLA will be used). Devices:
    Thu Jun 18 14:28:37 2020[1,4]<stderr>:2020-06-18 14:28:37.732081: I tensorflow/compiler/xla/service/service.cc:176]   StreamExecutor device (0): Host, Default Version
    Thu Jun 18 14:28:37 2020[1,7]<stderr>:2020-06-18 14:28:37.731186: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1555] Found device 0 with properties: 
    Thu Jun 18 14:28:37 2020[1,7]<stderr>:pciBusID: 0000:86:00.0 name: Tesla P100-PCIE-12GB computeCapability: 6.0
    Thu Jun 18 14:28:37 2020[1,7]<stderr>:coreClock: 1.3285GHz coreCount: 56 deviceMemorySize: 11.91GiB deviceMemoryBandwidth: 511.41GiB/s
    Thu Jun 18 14:28:37 2020[1,7]<stderr>:2020-06-18 14:28:37.731310: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:37 2020[1,0]<stderr>:2020-06-18 14:28:37.733527: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:37 2020[1,2]<stderr>:2020-06-18 14:28:37.733892: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:37 2020[1,0]<stderr>:2020-06-18 14:28:37.736069: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcufft.so.10
    Thu Jun 18 14:28:37 2020[1,0]<stderr>:2020-06-18 14:28:37.736463: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcurand.so.10
    Thu Jun 18 14:28:37 2020[1,7]<stderr>:2020-06-18 14:28:37.736129: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:37 2020[1,0]<stderr>:2020-06-18 14:28:37.739061: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusolver.so.10
    Thu Jun 18 14:28:37 2020[1,0]<stderr>:2020-06-18 14:28:37.740414: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusparse.so.10
    Thu Jun 18 14:28:37 2020[1,2]<stderr>:2020-06-18 14:28:37.741579: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1697] Adding visible gpu devices: 0
    Thu Jun 18 14:28:37 2020[1,5]<stderr>:2020-06-18 14:28:37.741642: I tensorflow/core/platform/cpu_feature_guard.cc:142] Your CPU supports instructions that this TensorFlow binary was not compiled to use: AVX2 FMA
    Thu Jun 18 14:28:37 2020[1,7]<stderr>:2020-06-18 14:28:37.740984: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcufft.so.10
    Thu Jun 18 14:28:37 2020[1,7]<stderr>:2020-06-18 14:28:37.741787: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcurand.so.10
    Thu Jun 18 14:28:37 2020[1,3]<stderr>:2020-06-18 14:28:37.743041: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1697] Adding visible gpu devices: 0
    Thu Jun 18 14:28:37 2020[1,0]<stderr>:2020-06-18 14:28:37.745583: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:37 2020[1,7]<stderr>:2020-06-18 14:28:37.747110: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusolver.so.10
    Thu Jun 18 14:28:37 2020[1,7]<stderr>:2020-06-18 14:28:37.749912: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusparse.so.10
    Thu Jun 18 14:28:37 2020[1,5]<stderr>:2020-06-18 14:28:37.761000: I tensorflow/core/platform/profile_utils/cpu_utils.cc:94] CPU Frequency: 2100150000 Hz
    Thu Jun 18 14:28:37 2020[1,7]<stderr>:2020-06-18 14:28:37.760388: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:37 2020[1,2]<stderr>:2020-06-18 14:28:37.763780: I tensorflow/core/platform/cpu_feature_guard.cc:142] Your CPU supports instructions that this TensorFlow binary was not compiled to use: AVX2 FMA
    Thu Jun 18 14:28:37 2020[1,5]<stderr>:2020-06-18 14:28:37.768916: I tensorflow/compiler/xla/service/service.cc:168] XLA service 0x3aaa040 initialized for platform Host (this does not guarantee that XLA will be used). Devices:
    Thu Jun 18 14:28:37 2020[1,5]<stderr>:2020-06-18 14:28:37.768938: I tensorflow/compiler/xla/service/service.cc:176]   StreamExecutor device (0): Host, Default Version
    Thu Jun 18 14:28:37 2020[1,2]<stderr>:2020-06-18 14:28:37.779117: I tensorflow/core/platform/profile_utils/cpu_utils.cc:94] CPU Frequency: 2100150000 Hz
    Thu Jun 18 14:28:37 2020[1,3]<stderr>:2020-06-18 14:28:37.779808: I tensorflow/core/platform/cpu_feature_guard.cc:142] Your CPU supports instructions that this TensorFlow binary was not compiled to use: AVX2 FMA
    Thu Jun 18 14:28:37 2020[1,6]<stderr>:2020-06-18 14:28:37.788058: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1555] Found device 0 with properties: 
    Thu Jun 18 14:28:37 2020[1,6]<stderr>:pciBusID: 0000:04:00.0 name: Tesla P100-PCIE-12GB computeCapability: 6.0
    Thu Jun 18 14:28:37 2020[1,6]<stderr>:coreClock: 1.3285GHz coreCount: 56 deviceMemorySize: 11.91GiB deviceMemoryBandwidth: 511.41GiB/s
    Thu Jun 18 14:28:37 2020[1,6]<stderr>:2020-06-18 14:28:37.788197: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:37 2020[1,2]<stderr>:2020-06-18 14:28:37.791168: I tensorflow/compiler/xla/service/service.cc:168] XLA service 0x41308d0 initialized for platform Host (this does not guarantee that XLA will be used). Devices:
    Thu Jun 18 14:28:37 2020[1,2]<stderr>:2020-06-18 14:28:37.791213: I tensorflow/compiler/xla/service/service.cc:176]   StreamExecutor device (0): Host, Default Version
    Thu Jun 18 14:28:37 2020[1,0]<stderr>:2020-06-18 14:28:37.791376: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1697] Adding visible gpu devices: 0
    Thu Jun 18 14:28:37 2020[1,6]<stderr>:2020-06-18 14:28:37.793255: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:37 2020[1,7]<stderr>:2020-06-18 14:28:37.795396: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1697] Adding visible gpu devices: 0
    Thu Jun 18 14:28:37 2020[1,6]<stderr>:2020-06-18 14:28:37.798240: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcufft.so.10
    Thu Jun 18 14:28:37 2020[1,6]<stderr>:2020-06-18 14:28:37.799060: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcurand.so.10
    Thu Jun 18 14:28:37 2020[1,6]<stderr>:2020-06-18 14:28:37.804501: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusolver.so.10
    Thu Jun 18 14:28:37 2020[1,1]<stderr>:2020-06-18 14:28:37.807045: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1555] Found device 0 with properties: 
    Thu Jun 18 14:28:37 2020[1,1]<stderr>:pciBusID: 0000:85:00.0 name: Tesla P100-PCIE-12GB computeCapability: 6.0
    Thu Jun 18 14:28:37 2020[1,1]<stderr>:coreClock: 1.3285GHz coreCount: 56 deviceMemorySize: 11.91GiB deviceMemoryBandwidth: 511.41GiB/s
    Thu Jun 18 14:28:37 2020[1,1]<stderr>:2020-06-18 14:28:37.807171: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:37 2020[1,6]<stderr>:2020-06-18 14:28:37.807337: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusparse.so.10
    Thu Jun 18 14:28:37 2020[1,0]<stderr>:2020-06-18 14:28:37.808978: I tensorflow/core/platform/cpu_feature_guard.cc:142] Your CPU supports instructions that this TensorFlow binary was not compiled to use: AVX2 FMA
    Thu Jun 18 14:28:37 2020[1,3]<stderr>:2020-06-18 14:28:37.810830: I tensorflow/core/platform/profile_utils/cpu_utils.cc:94] CPU Frequency: 2100050000 Hz
    Thu Jun 18 14:28:37 2020[1,1]<stderr>:2020-06-18 14:28:37.811985: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:37 2020[1,1]<stderr>:2020-06-18 14:28:37.816894: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcufft.so.10
    Thu Jun 18 14:28:37 2020[1,1]<stderr>:2020-06-18 14:28:37.817727: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcurand.so.10
    Thu Jun 18 14:28:37 2020[1,6]<stderr>:2020-06-18 14:28:37.818139: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:37 2020[1,1]<stderr>:2020-06-18 14:28:37.823035: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusolver.so.10
    Thu Jun 18 14:28:37 2020[1,6]<stderr>:2020-06-18 14:28:37.823981: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1697] Adding visible gpu devices: 0
    Thu Jun 18 14:28:37 2020[1,1]<stderr>:2020-06-18 14:28:37.825879: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusparse.so.10
    Thu Jun 18 14:28:37 2020[1,3]<stderr>:2020-06-18 14:28:37.826036: I tensorflow/compiler/xla/service/service.cc:168] XLA service 0x3e10350 initialized for platform Host (this does not guarantee that XLA will be used). Devices:
    Thu Jun 18 14:28:37 2020[1,3]<stderr>:2020-06-18 14:28:37.826118: I tensorflow/compiler/xla/service/service.cc:176]   StreamExecutor device (0): Host, Default Version
    Thu Jun 18 14:28:37 2020[1,0]<stderr>:2020-06-18 14:28:37.827756: I tensorflow/core/platform/profile_utils/cpu_utils.cc:94] CPU Frequency: 2100150000 Hz
    Thu Jun 18 14:28:37 2020[1,1]<stderr>:2020-06-18 14:28:37.836349: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:37 2020[1,0]<stderr>:2020-06-18 14:28:37.841990: I tensorflow/compiler/xla/service/service.cc:168] XLA service 0x45b1540 initialized for platform Host (this does not guarantee that XLA will be used). Devices:
    Thu Jun 18 14:28:37 2020[1,0]<stderr>:2020-06-18 14:28:37.842050: I tensorflow/compiler/xla/service/service.cc:176]   StreamExecutor device (0): Host, Default Version
    Thu Jun 18 14:28:37 2020[1,7]<stderr>:2020-06-18 14:28:37.845314: I tensorflow/core/platform/cpu_feature_guard.cc:142] Your CPU supports instructions that this TensorFlow binary was not compiled to use: AVX2 FMA
    Thu Jun 18 14:28:37 2020[1,6]<stderr>:2020-06-18 14:28:37.860055: I tensorflow/core/platform/cpu_feature_guard.cc:142] Your CPU supports instructions that this TensorFlow binary was not compiled to use: AVX2 FMA
    Thu Jun 18 14:28:37 2020[1,7]<stderr>:2020-06-18 14:28:37.890372: I tensorflow/core/platform/profile_utils/cpu_utils.cc:94] CPU Frequency: 2100050000 Hz
    Thu Jun 18 14:28:37 2020[1,7]<stderr>:2020-06-18 14:28:37.905705: I tensorflow/compiler/xla/service/service.cc:168] XLA service 0x4d71160 initialized for platform Host (this does not guarantee that XLA will be used). Devices:
    Thu Jun 18 14:28:37 2020[1,7]<stderr>:2020-06-18 14:28:37.905750: I tensorflow/compiler/xla/service/service.cc:176]   StreamExecutor device (0): Host, Default Version
    Thu Jun 18 14:28:37 2020[1,6]<stderr>:2020-06-18 14:28:37.905684: I tensorflow/core/platform/profile_utils/cpu_utils.cc:94] CPU Frequency: 2100050000 Hz
    Thu Jun 18 14:28:37 2020[1,1]<stderr>:2020-06-18 14:28:37.929985: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1697] Adding visible gpu devices: 0
    Thu Jun 18 14:28:37 2020[1,6]<stderr>:2020-06-18 14:28:37.930930: I tensorflow/compiler/xla/service/service.cc:168] XLA service 0x3e91a50 initialized for platform Host (this does not guarantee that XLA will be used). Devices:
    Thu Jun 18 14:28:37 2020[1,6]<stderr>:2020-06-18 14:28:37.930991: I tensorflow/compiler/xla/service/service.cc:176]   StreamExecutor device (0): Host, Default Version
    Thu Jun 18 14:28:37 2020[1,1]<stderr>:2020-06-18 14:28:37.967036: I tensorflow/core/platform/cpu_feature_guard.cc:142] Your CPU supports instructions that this TensorFlow binary was not compiled to use: AVX2 FMA
    Thu Jun 18 14:28:38 2020[1,1]<stderr>:2020-06-18 14:28:38.010446: I tensorflow/core/platform/profile_utils/cpu_utils.cc:94] CPU Frequency: 2100050000 Hz
    Thu Jun 18 14:28:38 2020[1,1]<stderr>:2020-06-18 14:28:38.034474: I tensorflow/compiler/xla/service/service.cc:168] XLA service 0x5392590 initialized for platform Host (this does not guarantee that XLA will be used). Devices:
    Thu Jun 18 14:28:38 2020[1,1]<stderr>:2020-06-18 14:28:38.034546: I tensorflow/compiler/xla/service/service.cc:176]   StreamExecutor device (0): Host, Default Version
    Thu Jun 18 14:28:38 2020[1,4]<stderr>:2020-06-18 14:28:38.143748: I tensorflow/compiler/xla/service/service.cc:168] XLA service 0x36f4230 initialized for platform CUDA (this does not guarantee that XLA will be used). Devices:
    Thu Jun 18 14:28:38 2020[1,4]<stderr>:2020-06-18 14:28:38.143789: I tensorflow/compiler/xla/service/service.cc:176]   StreamExecutor device (0): Tesla P100-PCIE-12GB, Compute Capability 6.0
    Thu Jun 18 14:28:38 2020[1,4]<stderr>:2020-06-18 14:28:38.146626: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1555] Found device 0 with properties: 
    Thu Jun 18 14:28:38 2020[1,4]<stderr>:pciBusID: 0000:05:00.0 name: Tesla P100-PCIE-12GB computeCapability: 6.0
    Thu Jun 18 14:28:38 2020[1,4]<stderr>:coreClock: 1.3285GHz coreCount: 56 deviceMemorySize: 11.91GiB deviceMemoryBandwidth: 511.41GiB/s
    Thu Jun 18 14:28:38 2020[1,4]<stderr>:2020-06-18 14:28:38.146683: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:38 2020[1,4]<stderr>:2020-06-18 14:28:38.146719: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:38 2020[1,4]<stderr>:2020-06-18 14:28:38.146737: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcufft.so.10
    Thu Jun 18 14:28:38 2020[1,4]<stderr>:2020-06-18 14:28:38.146752: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcurand.so.10
    Thu Jun 18 14:28:38 2020[1,4]<stderr>:2020-06-18 14:28:38.146767: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusolver.so.10
    Thu Jun 18 14:28:38 2020[1,4]<stderr>:2020-06-18 14:28:38.146780: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusparse.so.10
    Thu Jun 18 14:28:38 2020[1,4]<stderr>:2020-06-18 14:28:38.146798: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:38 2020[1,4]<stderr>:2020-06-18 14:28:38.151774: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1697] Adding visible gpu devices: 0
    Thu Jun 18 14:28:38 2020[1,4]<stderr>:2020-06-18 14:28:38.151847: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:38 2020[1,5]<stderr>:2020-06-18 14:28:38.156831: I tensorflow/compiler/xla/service/service.cc:168] XLA service 0x3a47730 initialized for platform CUDA (this does not guarantee that XLA will be used). Devices:
    Thu Jun 18 14:28:38 2020[1,5]<stderr>:2020-06-18 14:28:38.156866: I tensorflow/compiler/xla/service/service.cc:176]   StreamExecutor device (0): Tesla P100-PCIE-12GB, Compute Capability 6.0
    Thu Jun 18 14:28:38 2020[1,5]<stderr>:2020-06-18 14:28:38.161455: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1555] Found device 0 with properties: 
    Thu Jun 18 14:28:38 2020[1,5]<stderr>:pciBusID: 0000:85:00.0 name: Tesla P100-PCIE-12GB computeCapability: 6.0
    Thu Jun 18 14:28:38 2020[1,5]<stderr>:coreClock: 1.3285GHz coreCount: 56 deviceMemorySize: 11.91GiB deviceMemoryBandwidth: 511.41GiB/s
    Thu Jun 18 14:28:38 2020[1,5]<stderr>:2020-06-18 14:28:38.161514: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:38 2020[1,5]<stderr>:2020-06-18 14:28:38.161558: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:38 2020[1,5]<stderr>:2020-06-18 14:28:38.161579: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcufft.so.10
    Thu Jun 18 14:28:38 2020[1,5]<stderr>:2020-06-18 14:28:38.161597: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcurand.so.10
    Thu Jun 18 14:28:38 2020[1,5]<stderr>:2020-06-18 14:28:38.161640: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusolver.so.10
    Thu Jun 18 14:28:38 2020[1,5]<stderr>:2020-06-18 14:28:38.161662: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusparse.so.10
    Thu Jun 18 14:28:38 2020[1,5]<stderr>:2020-06-18 14:28:38.161688: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:38 2020[1,2]<stderr>:2020-06-18 14:28:38.168040: I tensorflow/compiler/xla/service/service.cc:168] XLA service 0x4837fd0 initialized for platform CUDA (this does not guarantee that XLA will be used). Devices:
    Thu Jun 18 14:28:38 2020[1,2]<stderr>:2020-06-18 14:28:38.168073: I tensorflow/compiler/xla/service/service.cc:176]   StreamExecutor device (0): Tesla P100-PCIE-12GB, Compute Capability 6.0
    Thu Jun 18 14:28:38 2020[1,5]<stderr>:2020-06-18 14:28:38.171353: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1697] Adding visible gpu devices: 0
    Thu Jun 18 14:28:38 2020[1,5]<stderr>:2020-06-18 14:28:38.171398: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:38 2020[1,0]<stderr>:2020-06-18 14:28:38.172512: I tensorflow/compiler/xla/service/service.cc:168] XLA service 0x4cb7f40 initialized for platform CUDA (this does not guarantee that XLA will be used). Devices:
    Thu Jun 18 14:28:38 2020[1,0]<stderr>:2020-06-18 14:28:38.172537: I tensorflow/compiler/xla/service/service.cc:176]   StreamExecutor device (0): Tesla P100-PCIE-12GB, Compute Capability 6.0
    Thu Jun 18 14:28:38 2020[1,2]<stderr>:2020-06-18 14:28:38.174738: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1555] Found device 0 with properties: 
    Thu Jun 18 14:28:38 2020[1,2]<stderr>:pciBusID: 0000:04:00.0 name: Tesla P100-PCIE-12GB computeCapability: 6.0
    Thu Jun 18 14:28:38 2020[1,2]<stderr>:coreClock: 1.3285GHz coreCount: 56 deviceMemorySize: 11.91GiB deviceMemoryBandwidth: 511.41GiB/s
    Thu Jun 18 14:28:38 2020[1,2]<stderr>:2020-06-18 14:28:38.174796: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:38 2020[1,2]<stderr>:2020-06-18 14:28:38.174831: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:38 2020[1,2]<stderr>:2020-06-18 14:28:38.174860: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcufft.so.10
    Thu Jun 18 14:28:38 2020[1,2]<stderr>:2020-06-18 14:28:38.174879: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcurand.so.10
    Thu Jun 18 14:28:38 2020[1,2]<stderr>:2020-06-18 14:28:38.174912: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusolver.so.10
    Thu Jun 18 14:28:38 2020[1,2]<stderr>:2020-06-18 14:28:38.174929: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusparse.so.10
    Thu Jun 18 14:28:38 2020[1,2]<stderr>:2020-06-18 14:28:38.174947: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:38 2020[1,0]<stderr>:2020-06-18 14:28:38.178750: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1555] Found device 0 with properties: 
    Thu Jun 18 14:28:38 2020[1,0]<stderr>:pciBusID: 0000:86:00.0 name: Tesla P100-PCIE-12GB computeCapability: 6.0
    Thu Jun 18 14:28:38 2020[1,0]<stderr>:coreClock: 1.3285GHz coreCount: 56 deviceMemorySize: 11.91GiB deviceMemoryBandwidth: 511.41GiB/s
    Thu Jun 18 14:28:38 2020[1,0]<stderr>:2020-06-18 14:28:38.178815: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:38 2020[1,0]<stderr>:2020-06-18 14:28:38.178854: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:38 2020[1,0]<stderr>:2020-06-18 14:28:38.178875: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcufft.so.10
    Thu Jun 18 14:28:38 2020[1,0]<stderr>:2020-06-18 14:28:38.178896: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcurand.so.10
    Thu Jun 18 14:28:38 2020[1,0]<stderr>:2020-06-18 14:28:38.178917: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusolver.so.10
    Thu Jun 18 14:28:38 2020[1,0]<stderr>:2020-06-18 14:28:38.178935: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusparse.so.10
    Thu Jun 18 14:28:38 2020[1,0]<stderr>:2020-06-18 14:28:38.178954: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:38 2020[1,2]<stderr>:2020-06-18 14:28:38.183758: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1697] Adding visible gpu devices: 0
    Thu Jun 18 14:28:38 2020[1,2]<stderr>:2020-06-18 14:28:38.183823: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:38 2020[1,0]<stderr>:2020-06-18 14:28:38.186304: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1697] Adding visible gpu devices: 0
    Thu Jun 18 14:28:38 2020[1,0]<stderr>:2020-06-18 14:28:38.186371: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:38 2020[1,4]<stderr>:2020-06-18 14:28:38.229257: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1096] Device interconnect StreamExecutor with strength 1 edge matrix:
    Thu Jun 18 14:28:38 2020[1,4]<stderr>:2020-06-18 14:28:38.229309: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1102]      0 
    Thu Jun 18 14:28:38 2020[1,4]<stderr>:2020-06-18 14:28:38.229321: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1115] 0:   N 
    Thu Jun 18 14:28:38 2020[1,4]<stderr>:2020-06-18 14:28:38.235128: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1241] Created TensorFlow device (/job:localhost/replica:0/task:0/device:GPU:0 with 11329 MB memory) -> physical GPU (device: 0, name: Tesla P100-PCIE-12GB, pci bus id: 0000:05:00.0, compute capability: 6.0)
    Thu Jun 18 14:28:38 2020[1,5]<stderr>:2020-06-18 14:28:38.251463: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1096] Device interconnect StreamExecutor with strength 1 edge matrix:
    Thu Jun 18 14:28:38 2020[1,5]<stderr>:2020-06-18 14:28:38.251506: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1102]      0 
    Thu Jun 18 14:28:38 2020[1,5]<stderr>:2020-06-18 14:28:38.251517: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1115] 0:   N 
    Thu Jun 18 14:28:38 2020[1,5]<stderr>:2020-06-18 14:28:38.255448: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1241] Created TensorFlow device (/job:localhost/replica:0/task:0/device:GPU:0 with 11329 MB memory) -> physical GPU (device: 0, name: Tesla P100-PCIE-12GB, pci bus id: 0000:85:00.0, compute capability: 6.0)
    Thu Jun 18 14:28:38 2020[1,2]<stderr>:2020-06-18 14:28:38.261710: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1096] Device interconnect StreamExecutor with strength 1 edge matrix:
    Thu Jun 18 14:28:38 2020[1,2]<stderr>:2020-06-18 14:28:38.261745: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1102]      0 
    Thu Jun 18 14:28:38 2020[1,2]<stderr>:2020-06-18 14:28:38.261755: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1115] 0:   N 
    Thu Jun 18 14:28:38 2020[1,0]<stderr>:2020-06-18 14:28:38.262127: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1096] Device interconnect StreamExecutor with strength 1 edge matrix:
    Thu Jun 18 14:28:38 2020[1,0]<stderr>:2020-06-18 14:28:38.262155: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1102]      0 
    Thu Jun 18 14:28:38 2020[1,0]<stderr>:2020-06-18 14:28:38.262164: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1115] 0:   N 
    Thu Jun 18 14:28:38 2020[1,2]<stderr>:2020-06-18 14:28:38.271327: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1241] Created TensorFlow device (/job:localhost/replica:0/task:0/device:GPU:0 with 11329 MB memory) -> physical GPU (device: 0, name: Tesla P100-PCIE-12GB, pci bus id: 0000:04:00.0, compute capability: 6.0)
    Thu Jun 18 14:28:38 2020[1,0]<stderr>:2020-06-18 14:28:38.272123: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1241] Created TensorFlow device (/job:localhost/replica:0/task:0/device:GPU:0 with 11329 MB memory) -> physical GPU (device: 0, name: Tesla P100-PCIE-12GB, pci bus id: 0000:86:00.0, compute capability: 6.0)
    Thu Jun 18 14:28:38 2020[1,3]<stderr>:2020-06-18 14:28:38.507900: I tensorflow/compiler/xla/service/service.cc:168] XLA service 0x44fff50 initialized for platform CUDA (this does not guarantee that XLA will be used). Devices:
    Thu Jun 18 14:28:38 2020[1,3]<stderr>:2020-06-18 14:28:38.507957: I tensorflow/compiler/xla/service/service.cc:176]   StreamExecutor device (0): Tesla P100-PCIE-12GB, Compute Capability 6.0
    Thu Jun 18 14:28:38 2020[1,3]<stderr>:2020-06-18 14:28:38.511133: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1555] Found device 0 with properties: 
    Thu Jun 18 14:28:38 2020[1,3]<stderr>:pciBusID: 0000:05:00.0 name: Tesla P100-PCIE-12GB computeCapability: 6.0
    Thu Jun 18 14:28:38 2020[1,3]<stderr>:coreClock: 1.3285GHz coreCount: 56 deviceMemorySize: 11.91GiB deviceMemoryBandwidth: 511.41GiB/s
    Thu Jun 18 14:28:38 2020[1,3]<stderr>:2020-06-18 14:28:38.511224: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:38 2020[1,3]<stderr>:2020-06-18 14:28:38.511289: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:38 2020[1,3]<stderr>:2020-06-18 14:28:38.511326: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcufft.so.10
    Thu Jun 18 14:28:38 2020[1,3]<stderr>:2020-06-18 14:28:38.511363: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcurand.so.10
    Thu Jun 18 14:28:38 2020[1,3]<stderr>:2020-06-18 14:28:38.511400: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusolver.so.10
    Thu Jun 18 14:28:38 2020[1,3]<stderr>:2020-06-18 14:28:38.511430: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusparse.so.10
    Thu Jun 18 14:28:38 2020[1,3]<stderr>:2020-06-18 14:28:38.511467: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:38 2020[1,3]<stderr>:2020-06-18 14:28:38.518097: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1697] Adding visible gpu devices: 0
    Thu Jun 18 14:28:38 2020[1,3]<stderr>:2020-06-18 14:28:38.518185: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:38 2020[1,7]<stderr>:2020-06-18 14:28:38.529167: I tensorflow/compiler/xla/service/service.cc:168] XLA service 0x5434da0 initialized for platform CUDA (this does not guarantee that XLA will be used). Devices:
    Thu Jun 18 14:28:38 2020[1,7]<stderr>:2020-06-18 14:28:38.529220: I tensorflow/compiler/xla/service/service.cc:176]   StreamExecutor device (0): Tesla P100-PCIE-12GB, Compute Capability 6.0
    Thu Jun 18 14:28:38 2020[1,7]<stderr>:2020-06-18 14:28:38.537194: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1555] Found device 0 with properties: 
    Thu Jun 18 14:28:38 2020[1,7]<stderr>:pciBusID: 0000:86:00.0 name: Tesla P100-PCIE-12GB computeCapability: 6.0
    Thu Jun 18 14:28:38 2020[1,7]<stderr>:coreClock: 1.3285GHz coreCount: 56 deviceMemorySize: 11.91GiB deviceMemoryBandwidth: 511.41GiB/s
    Thu Jun 18 14:28:38 2020[1,7]<stderr>:2020-06-18 14:28:38.537296: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:38 2020[1,7]<stderr>:2020-06-18 14:28:38.537362: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:38 2020[1,7]<stderr>:2020-06-18 14:28:38.537407: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcufft.so.10
    Thu Jun 18 14:28:38 2020[1,7]<stderr>:2020-06-18 14:28:38.537448: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcurand.so.10
    Thu Jun 18 14:28:38 2020[1,7]<stderr>:2020-06-18 14:28:38.537490: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusolver.so.10
    Thu Jun 18 14:28:38 2020[1,7]<stderr>:2020-06-18 14:28:38.537532: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusparse.so.10
    Thu Jun 18 14:28:38 2020[1,7]<stderr>:2020-06-18 14:28:38.537574: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:38 2020[1,6]<stderr>:2020-06-18 14:28:38.537671: I tensorflow/compiler/xla/service/service.cc:168] XLA service 0x3edb400 initialized for platform CUDA (this does not guarantee that XLA will be used). Devices:
    Thu Jun 18 14:28:38 2020[1,6]<stderr>:2020-06-18 14:28:38.537741: I tensorflow/compiler/xla/service/service.cc:176]   StreamExecutor device (0): Tesla P100-PCIE-12GB, Compute Capability 6.0
    Thu Jun 18 14:28:38 2020[1,1]<stderr>:2020-06-18 14:28:38.544176: I tensorflow/compiler/xla/service/service.cc:168] XLA service 0x53968e0 initialized for platform CUDA (this does not guarantee that XLA will be used). Devices:
    Thu Jun 18 14:28:38 2020[1,1]<stderr>:2020-06-18 14:28:38.544231: I tensorflow/compiler/xla/service/service.cc:176]   StreamExecutor device (0): Tesla P100-PCIE-12GB, Compute Capability 6.0
    Thu Jun 18 14:28:38 2020[1,6]<stderr>:2020-06-18 14:28:38.547737: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1555] Found device 0 with properties: 
    Thu Jun 18 14:28:38 2020[1,6]<stderr>:pciBusID: 0000:04:00.0 name: Tesla P100-PCIE-12GB computeCapability: 6.0
    Thu Jun 18 14:28:38 2020[1,6]<stderr>:coreClock: 1.3285GHz coreCount: 56 deviceMemorySize: 11.91GiB deviceMemoryBandwidth: 511.41GiB/s
    Thu Jun 18 14:28:38 2020[1,6]<stderr>:2020-06-18 14:28:38.547832: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:38 2020[1,6]<stderr>:2020-06-18 14:28:38.547894: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:38 2020[1,6]<stderr>:2020-06-18 14:28:38.547931: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcufft.so.10
    Thu Jun 18 14:28:38 2020[1,6]<stderr>:2020-06-18 14:28:38.547967: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcurand.so.10
    Thu Jun 18 14:28:38 2020[1,6]<stderr>:2020-06-18 14:28:38.548001: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusolver.so.10
    Thu Jun 18 14:28:38 2020[1,6]<stderr>:2020-06-18 14:28:38.548035: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusparse.so.10
    Thu Jun 18 14:28:38 2020[1,6]<stderr>:2020-06-18 14:28:38.548070: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:38 2020[1,1]<stderr>:2020-06-18 14:28:38.553117: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1555] Found device 0 with properties: 
    Thu Jun 18 14:28:38 2020[1,1]<stderr>:pciBusID: 0000:85:00.0 name: Tesla P100-PCIE-12GB computeCapability: 6.0
    Thu Jun 18 14:28:38 2020[1,1]<stderr>:coreClock: 1.3285GHz coreCount: 56 deviceMemorySize: 11.91GiB deviceMemoryBandwidth: 511.41GiB/s
    Thu Jun 18 14:28:38 2020[1,1]<stderr>:2020-06-18 14:28:38.553221: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:38 2020[1,1]<stderr>:2020-06-18 14:28:38.553281: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:38 2020[1,1]<stderr>:2020-06-18 14:28:38.553322: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcufft.so.10
    Thu Jun 18 14:28:38 2020[1,1]<stderr>:2020-06-18 14:28:38.553361: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcurand.so.10
    Thu Jun 18 14:28:38 2020[1,1]<stderr>:2020-06-18 14:28:38.553398: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusolver.so.10
    Thu Jun 18 14:28:38 2020[1,1]<stderr>:2020-06-18 14:28:38.553437: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcusparse.so.10
    Thu Jun 18 14:28:38 2020[1,1]<stderr>:2020-06-18 14:28:38.553476: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:38 2020[1,7]<stderr>:2020-06-18 14:28:38.555390: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1697] Adding visible gpu devices: 0
    Thu Jun 18 14:28:38 2020[1,7]<stderr>:2020-06-18 14:28:38.555549: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:38 2020[1,6]<stderr>:2020-06-18 14:28:38.566038: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1697] Adding visible gpu devices: 0
    Thu Jun 18 14:28:38 2020[1,6]<stderr>:2020-06-18 14:28:38.566147: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:38 2020[1,1]<stderr>:2020-06-18 14:28:38.570111: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1697] Adding visible gpu devices: 0
    Thu Jun 18 14:28:38 2020[1,1]<stderr>:2020-06-18 14:28:38.570214: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudart.so.10.1
    Thu Jun 18 14:28:38 2020[1,3]<stderr>:2020-06-18 14:28:38.673102: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1096] Device interconnect StreamExecutor with strength 1 edge matrix:
    Thu Jun 18 14:28:38 2020[1,3]<stderr>:2020-06-18 14:28:38.673184: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1102]      0 
    Thu Jun 18 14:28:38 2020[1,3]<stderr>:2020-06-18 14:28:38.673206: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1115] 0:   N 
    Thu Jun 18 14:28:38 2020[1,3]<stderr>:2020-06-18 14:28:38.679445: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1241] Created TensorFlow device (/job:localhost/replica:0/task:0/device:GPU:0 with 11329 MB memory) -> physical GPU (device: 0, name: Tesla P100-PCIE-12GB, pci bus id: 0000:05:00.0, compute capability: 6.0)
    Thu Jun 18 14:28:38 2020[1,7]<stderr>:2020-06-18 14:28:38.713765: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1096] Device interconnect StreamExecutor with strength 1 edge matrix:
    Thu Jun 18 14:28:38 2020[1,7]<stderr>:2020-06-18 14:28:38.713864: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1102]      0 
    Thu Jun 18 14:28:38 2020[1,7]<stderr>:2020-06-18 14:28:38.713890: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1115] 0:   N 
    Thu Jun 18 14:28:38 2020[1,6]<stderr>:2020-06-18 14:28:38.715515: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1096] Device interconnect StreamExecutor with strength 1 edge matrix:
    Thu Jun 18 14:28:38 2020[1,6]<stderr>:2020-06-18 14:28:38.715578: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1102]      0 
    Thu Jun 18 14:28:38 2020[1,6]<stderr>:2020-06-18 14:28:38.715597: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1115] 0:   N 
    Thu Jun 18 14:28:38 2020[1,1]<stderr>:2020-06-18 14:28:38.719569: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1096] Device interconnect StreamExecutor with strength 1 edge matrix:
    Thu Jun 18 14:28:38 2020[1,1]<stderr>:2020-06-18 14:28:38.719630: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1102]      0 
    Thu Jun 18 14:28:38 2020[1,1]<stderr>:2020-06-18 14:28:38.719649: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1115] 0:   N 
    Thu Jun 18 14:28:38 2020[1,7]<stderr>:2020-06-18 14:28:38.727667: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1241] Created TensorFlow device (/job:localhost/replica:0/task:0/device:GPU:0 with 11329 MB memory) -> physical GPU (device: 0, name: Tesla P100-PCIE-12GB, pci bus id: 0000:86:00.0, compute capability: 6.0)
    Thu Jun 18 14:28:38 2020[1,6]<stderr>:2020-06-18 14:28:38.732686: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1241] Created TensorFlow device (/job:localhost/replica:0/task:0/device:GPU:0 with 11329 MB memory) -> physical GPU (device: 0, name: Tesla P100-PCIE-12GB, pci bus id: 0000:04:00.0, compute capability: 6.0)
    Thu Jun 18 14:28:38 2020[1,1]<stderr>:2020-06-18 14:28:38.735366: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1241] Created TensorFlow device (/job:localhost/replica:0/task:0/device:GPU:0 with 11329 MB memory) -> physical GPU (device: 0, name: Tesla P100-PCIE-12GB, pci bus id: 0000:85:00.0, compute capability: 6.0)
    Thu Jun 18 14:28:41 2020[1,0]<stdout>:Model: ResNet50
    Thu Jun 18 14:28:41 2020[1,0]<stdout>:Batch size: 32
    Thu Jun 18 14:28:41 2020[1,0]<stdout>:Number of GPUs: 8
    Thu Jun 18 14:28:41 2020[1,0]<stdout>:Running warmup...
    Thu Jun 18 14:28:51 2020[1,5]<stderr>:2020-06-18 14:28:51.392570: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:51 2020[1,4]<stderr>:2020-06-18 14:28:51.467127: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:51 2020[1,5]<stderr>:2020-06-18 14:28:51.673963: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:51 2020[1,4]<stderr>:2020-06-18 14:28:51.768194: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:51 2020[1,0]<stderr>:2020-06-18 14:28:51.899698: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:51 2020[1,2]<stderr>:2020-06-18 14:28:51.944140: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:52 2020[1,0]<stderr>:2020-06-18 14:28:52.186594: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:52 2020[1,2]<stderr>:2020-06-18 14:28:52.243227: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:53 2020[1,3]<stderr>:2020-06-18 14:28:53.447621: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:53 2020[1,3]<stderr>:2020-06-18 14:28:53.731211: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:54 2020[1,7]<stderr>:2020-06-18 14:28:54.087244: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:54 2020[1,6]<stderr>:2020-06-18 14:28:54.113878: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:54 2020[1,7]<stderr>:2020-06-18 14:28:54.372818: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:54 2020[1,6]<stderr>:2020-06-18 14:28:54.407097: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:55 2020[1,1]<stderr>:2020-06-18 14:28:55.348738: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcublas.so.10
    Thu Jun 18 14:28:55 2020[1,1]<stderr>:2020-06-18 14:28:55.738010: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library libcudnn.so.7
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] NCCL INFO Bootstrap : Using [0]eth0:10.233.99.245<0> [1]net1:10.56.217.16<0>
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] NCCL INFO NET/Plugin : No plugin found (libnccl-net.so).
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_0
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_1
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_2
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_3
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_4
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_5
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_6
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_7
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_9
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] NCCL INFO NET/IB : Using [0]mlx5_8:1/RoCE ; OOB eth0:10.233.99.245<0>
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:NCCL version 2.4.8+cuda10.1
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] NCCL INFO Bootstrap : Using [0]eth0:10.233.64.78<0> [1]net1:10.56.217.17<0>
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] NCCL INFO NET/Plugin : No plugin found (libnccl-net.so).
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] NCCL INFO Bootstrap : Using [0]eth0:10.233.99.248<0> [1]net1:10.56.217.19<0>
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] NCCL INFO NET/Plugin : No plugin found (libnccl-net.so).
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] NCCL INFO Bootstrap : Using [0]eth0:10.233.99.246<0> [1]net1:10.56.217.18<0>
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] NCCL INFO NET/Plugin : No plugin found (libnccl-net.so).
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] NCCL INFO Bootstrap : Using [0]eth0:10.233.64.79<0> [1]net1:10.56.217.19<0>
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] NCCL INFO NET/Plugin : No plugin found (libnccl-net.so).
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] NCCL INFO Bootstrap : Using [0]eth0:10.233.99.247<0> [1]net1:10.56.217.17<0>
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] NCCL INFO NET/Plugin : No plugin found (libnccl-net.so).
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] NCCL INFO Bootstrap : Using [0]eth0:10.233.64.81<0> [1]net1:10.56.217.20<0>
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] NCCL INFO NET/Plugin : No plugin found (libnccl-net.so).
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_0
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_1
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_2
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_3
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_4
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_5
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_0
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_1
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_2
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_3
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_4
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_5
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_6
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_7
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_8
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_0
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_1
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_2
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_3
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_4
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_5
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_6
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] NCCL INFO Setting affinity for GPU 0 to aaaaaaaa,aaaaaaaa
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] NCCL INFO Bootstrap : Using [0]eth0:10.233.64.80<0> [1]net1:10.56.217.18<0>
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] NCCL INFO NET/Plugin : No plugin found (libnccl-net.so).
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_8
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_9
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] NCCL INFO NET/IB : Using [0]mlx5_7:1/RoCE ; OOB eth0:10.233.99.247<0>
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_7
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_8
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_9
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] NCCL INFO NET/IB : Using [0]mlx5_6:1/RoCE ; OOB eth0:10.233.99.248<0>
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] NCCL INFO NET/IB : Using [0]mlx5_9:1/RoCE ; OOB eth0:10.233.99.246<0>
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_0
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_1
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_2
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_3
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_4
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_5
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_6
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_7
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_8
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_0
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_1
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_2
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_3
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_4
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_5
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_6
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_0
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_1
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_2
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_3
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_4
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_5
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_0
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_1
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_2
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_3
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_4
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_5
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_6
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_7
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] NCCL INFO Setting affinity for GPU 0 to 55555555,55555555
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] NCCL INFO Setting affinity for GPU 0 to aaaaaaaa,aaaaaaaa
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] NCCL INFO Setting affinity for GPU 0 to 55555555,55555555
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] NCCL INFO NET/IB : Using [0]mlx5_9:1/RoCE ; OOB eth0:10.233.64.80<0>
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_9
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] NCCL INFO NET/IB : Using [0]mlx5_8:1/RoCE ; OOB eth0:10.233.64.78<0>
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_8
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_9
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] NCCL INFO NET/IB : Using [0]mlx5_7:1/RoCE ; OOB eth0:10.233.64.81<0>
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_7
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_8
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] misc/ibvwrap.cc:212 NCCL WARN Call to ibv_open_device failed
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] transport/net_ib.cc:117 NCCL WARN NET/IB : Unable to open device mlx5_9
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] NCCL INFO NET/IB : Using [0]mlx5_6:1/RoCE ; OOB eth0:10.233.64.79<0>
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] NCCL INFO Setting affinity for GPU 0 to aaaaaaaa,aaaaaaaa
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] NCCL INFO Setting affinity for GPU 0 to 55555555,55555555
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] NCCL INFO Setting affinity for GPU 0 to 55555555,55555555
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] NCCL INFO Setting affinity for GPU 0 to aaaaaaaa,aaaaaaaa
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] NCCL INFO CUDA Dev 0[3], IB NIC distance :  PHB
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] NCCL INFO CUDA Dev 0[0], IB NIC distance :  SYS
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] NCCL INFO CUDA Dev 0[3], IB NIC distance :  PHB
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] NCCL INFO CUDA Dev 0[1], IB NIC distance :  SYS
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] NCCL INFO CUDA Dev 0[2], IB NIC distance :  PHB
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] NCCL INFO CUDA Dev 0[2], IB NIC distance :  PHB
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] NCCL INFO CUDA Dev 0[0], IB NIC distance :  SYS
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] NCCL INFO CUDA Dev 0[1], IB NIC distance :  SYS
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] NCCL INFO Channel 00 :    0   1   2   3   4   5   6   7
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] NCCL INFO Ring 00 : 1 -> 2 [receive] via NET/IB/0
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] NCCL INFO Ring 00 : 4 -> 5 [receive] via NET/IB/0
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] NCCL INFO Ring 00 : 3 -> 4 [receive] via NET/IB/0
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] NCCL INFO Ring 00 : 7 -> 0 [receive] via NET/IB/0
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] NCCL INFO Ring 00 : 0 -> 1 [receive] via NET/IB/0
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] NCCL INFO Ring 00 : 6 -> 7 [receive] via NET/IB/0
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] NCCL INFO Ring 00 : 2 -> 3 [receive] via NET/IB/0
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] NCCL INFO Ring 00 : 5 -> 6 [receive] via NET/IB/0
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] NCCL INFO Ring 00 : 2 -> 3 [send] via NET/IB/0
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] NCCL INFO Ring 00 : 5 -> 6 [send] via NET/IB/0
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] NCCL INFO Ring 00 : 0 -> 1 [send] via NET/IB/0
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] NCCL INFO Ring 00 : 4 -> 5 [send] via NET/IB/0
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] NCCL INFO Ring 00 : 7 -> 0 [send] via NET/IB/0
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] NCCL INFO Ring 00 : 1 -> 2 [send] via NET/IB/0
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] NCCL INFO Ring 00 : 3 -> 4 [send] via NET/IB/0
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] NCCL INFO Ring 00 : 6 -> 7 [send] via NET/IB/0
    Thu Jun 18 14:28:58 2020[1,5]<stdout>:tf2-horovod-4:241:330 [0] NCCL INFO comm 0x7f0d1c378980 rank 5 nranks 8 cudaDev 0 nvmlDev 2 - Init COMPLETE
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] NCCL INFO Using 256 threads, Min Comp Cap 6, Trees disabled
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] NCCL INFO comm 0x7f858041ae60 rank 0 nranks 8 cudaDev 0 nvmlDev 3 - Init COMPLETE
    Thu Jun 18 14:28:58 2020[1,0]<stdout>:tf2-horovod-6clzb:30:97 [0] NCCL INFO Launch mode Parallel
    Thu Jun 18 14:28:58 2020[1,4]<stdout>:tf2-horovod-3:240:329 [0] NCCL INFO comm 0x7fd574371220 rank 4 nranks 8 cudaDev 0 nvmlDev 1 - Init COMPLETE
    Thu Jun 18 14:28:58 2020[1,2]<stdout>:tf2-horovod-1:262:351 [0] NCCL INFO comm 0x7f3a6c370c00 rank 2 nranks 8 cudaDev 0 nvmlDev 0 - Init COMPLETE
    Thu Jun 18 14:28:58 2020[1,3]<stdout>:tf2-horovod-2:262:352 [0] NCCL INFO comm 0x7ff3e0378ea0 rank 3 nranks 8 cudaDev 0 nvmlDev 1 - Init COMPLETE
    Thu Jun 18 14:28:58 2020[1,7]<stdout>:tf2-horovod-6:218:328 [0] NCCL INFO comm 0x7fbf98378ec0 rank 7 nranks 8 cudaDev 0 nvmlDev 3 - Init COMPLETE
    Thu Jun 18 14:28:58 2020[1,1]<stdout>:tf2-horovod-0:262:373 [0] NCCL INFO comm 0x7f5730370280 rank 1 nranks 8 cudaDev 0 nvmlDev 2 - Init COMPLETE
    Thu Jun 18 14:28:58 2020[1,6]<stdout>:tf2-horovod-5:237:329 [0] NCCL INFO comm 0x7fd3ac378980 rank 6 nranks 8 cudaDev 0 nvmlDev 0 - Init COMPLETE
    Thu Jun 18 14:29:07 2020[1,0]<stdout>:Running benchmark...
    Thu Jun 18 14:29:10 2020[1,0]<stdout>:Iter #0: 108.0 img/sec per GPU
    Thu Jun 18 14:29:13 2020[1,0]<stdout>:Iter #1: 108.6 img/sec per GPU
    Thu Jun 18 14:29:16 2020[1,0]<stdout>:Iter #2: 110.8 img/sec per GPU
    Thu Jun 18 14:29:19 2020[1,0]<stdout>:Iter #3: 104.8 img/sec per GPU
    Thu Jun 18 14:29:22 2020[1,0]<stdout>:Iter #4: 109.9 img/sec per GPU
    Thu Jun 18 14:29:25 2020[1,0]<stdout>:Iter #5: 108.8 img/sec per GPU
    Thu Jun 18 14:29:28 2020[1,0]<stdout>:Iter #6: 108.4 img/sec per GPU
    Thu Jun 18 14:29:30 2020[1,0]<stdout>:Iter #7: 111.8 img/sec per GPU
    Thu Jun 18 14:29:33 2020[1,0]<stdout>:Iter #8: 111.8 img/sec per GPU
    Thu Jun 18 14:29:36 2020[1,0]<stdout>:Iter #9: 109.8 img/sec per GPU
    Thu Jun 18 14:29:36 2020[1,0]<stdout>:Img/sec per GPU: 109.3 +-3.9
    Thu Jun 18 14:29:36 2020[1,0]<stdout>:Total img/sec on 8 GPU(s): 874.2 +-30.9
