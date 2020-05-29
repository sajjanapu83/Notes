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

-+++++++++++++++++++++++++++++++
# Kubernetes actually creates docker containers with NONE network & then invokes CNI plugins which takes care of rest of 
# the configuration
-+++++++++++++++++++++++++++++++


```
