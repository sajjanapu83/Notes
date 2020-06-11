## BASICS

- Two machines in a same network are connected to each other using SWITCHES
- Two machine in different networks are connected to each other using ROUTER via GATEWAY.

```diff

> ip link : To list and modify interfaces on the machine/host.
> ip addr : To see ip addresses assigned to those interfaces.
> ip addr add : To set addresses on the interfaces.
+ e.g: ip addr add 192.168.1.20/24 dev etho
- Note: These changes are valid till next restart, to persist these changes we need to update etc/network interfaces file.
> ip route or route: Is used to see the routing table.
> ip route add : Used to add entries in the routing table.
+ e.g: ip route add 192.168.1.0/24 via 192.168.2.1
- Note: By default packets are not forwarded from one network interface to other, to make this happen we need to enable
-  ip_forwarding using the below command 
! echo 1 > /proc/sys/net/ipv4/ip_forward
-  To persist the changes modify and set the below one in file located at /etc/sysctl.conf  
! net.ipv4.ip_forward = 1 

```

## POD Networking
#### POD Networking Model Rules
- Every pod in the k8s cluster should have unique IP address
- Every pod should be able to communicate with every other pod with in the same node.
- Every pod should be able to communicate with every other pod on other nodes without configuring NAT rules.

There are various Networking solutions available in the market which implements the above the rules...
e.g: Flannel, WeaveNet, cilium, vmware NSX ..etc.

- Every k8s node in the cluster, runs a kubelet process which is responsible for creating the pod.
- Each Kubelet service on each node listens/watches to the changes in the cluster through kube-api-server 
- Every time if a pod has to be created it creates the pod on the node with NONE network mode option.
- It then invokes the CNI network plugin to configure the networking for that pod.

## Service Networking
#### Service Networking Model Rules
- Unlike PODs, services are not created on each node or assigned to each node.
- They are cluster-wide concept & they exist across all the nodes in the cluster.
- Unlike PODs have containers and containers have namespaces with interfaces and Ips assigned to those interfaces.
  With services Nothing like that exists. There are no processes or name spaces or interfaces for a service.
- It's just a virtual object.
- When we create a service object in kubernetes, it is assigned an IP address from a pre-defined range. The kube-proxy components running on each node, get’s that IP address and creates forwarding rules on each node in the cluster, saying any traffic coming to this IP, the IP of the service, should go to the IP of the POD.

## Container Network Interface ( CNI )
![CNI](https://github.com/cskarthik22/Notes/blob/master/Kubernetes/Images/Screen%20Shot%202020-06-07%20at%2012.01.49%20AM.png)
- https://rancher.com/blog/2019/2019-03-21-comparing-kubernetes-cni-providers-flannel-calico-canal-and-weave/
- https://itnext.io/benchmark-results-of-kubernetes-network-plugins-cni-over-10gbit-s-network-updated-april-2019-4a9886efe9c4
- https://www.objectif-libre.com/en/blog/2018/07/05/k8s-network-solutions-comparison/


