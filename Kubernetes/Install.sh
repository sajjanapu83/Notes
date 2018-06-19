#!/usr/bin/env bash

# STEP1:
#Pre-requisite : Install Docker

# STEP2:
cat /proc/swaps

swapoff -a

# vi /etc/fstab and comment the line that has swap.

cat < /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

setenforce 0
vim /etc/selinux/config # Modify SELINUX=permissive

# STEP3: Install Kubernetes
## Set the Proxy if required
export HTTP_PROXY=http://proxy.company.com:80
export HTTPS_PROXY=http://proxy.company.com:80
export NO_PROXY=localhost,127.0.0.0/8,company.com
yum -y update
yum install -y kubelet kubectl kubeadm etcd

# STEP4: Start kubelet service

systemctl daemon-reload;
systemctl enable kubelet;
systemctl start kubelet;

# STEP5: Initialize kubeadm

cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system

docker info | grep -i cgroup
cat /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
sed -i "s/cgroup-driver=systemd/cgroup-driver=cgroupfs/g" /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
vi /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
Environment="KUBELET_EXTRA_ARGS=--fail-swap-on=false"

kubeadm init --pod-network-cidr=10.244.0.0/16


kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.9.1/Documentation/kube-flannel.yml
