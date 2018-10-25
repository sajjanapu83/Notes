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

systemctl daemon-reload;systemctl enable kubelet;systemctl start kubelet;
systemctl status kubelet;
journalctl -xeu kubelet
systemctl cat kubelet

# This wont work so first run 
echo 1 > /proc/sys/net/ipv4/ip_forward # Enable Ipv4 forwarding
kubeadm init # this will fail too, but restart kubelet
systemctl daemon-reload;systemctl restart kubelet; # this will work
kubeadm int # this will fail saying some port is in use
netstat -lnp | grep 1025 # indentify the process & kill the process
kill -9 *****


kubeadm init #
https://www.linuxtechi.com/install-kubernetes-1-7-centos7-rhel7/
systemctl enable firewalld
systemctl start firewalld
[root@k8s-master ~]# firewall-cmd --permanent --add-port=6443/tcp
[root@k8s-master ~]# firewall-cmd --permanent --add-port=2379-2380/tcp
[root@k8s-master ~]# firewall-cmd --permanent --add-port=10250/tcp
[root@k8s-master ~]# firewall-cmd --permanent --add-port=10251/tcp
[root@k8s-master ~]# firewall-cmd --permanent --add-port=10252/tcp
[root@k8s-master ~]# firewall-cmd --permanent --add-port=10255/tcp
[root@k8s-master ~]# firewall-cmd --reload
[root@k8s-master ~]# modprobe br_netfilter
[root@k8s-master ~]# echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables
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

http://yasassriratnayake.blogspot.com/2017/05/how-to-allow-insecurenon-ssl.html

kubeadm init --pod-network-cidr=10.244.0.0/16

cp /etc/kubernetes/admin.conf $HOME/
chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf
strace -eopenat kubectl version


kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.9.1/Documentation/kube-flannel.yml
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"


vim /etc/sysctl.conf
net.ipv4.ip_forward = 1
sysctl --system
