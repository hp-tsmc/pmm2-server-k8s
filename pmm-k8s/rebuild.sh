#! /bin/bash

# docker build -t pmm-server-k8s:0.1 .

microk8s ctr images rm docker.io/library/pmm-server-k8s:0.1

rm pmm-server-k8s:0.1.tar

docker save pmm-server-k8s:0.1 > pmm-server-k8s:0.1.tar

microk8s ctr image import pmm-server-k8s:0.1.tar