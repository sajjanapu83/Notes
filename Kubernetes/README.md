## K8s Offical docs
- https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/
- https://cheatsheet.dennyzhang.com

| Command  | Action |
| ------------- | ------------- |
| kubectl run nginx-pod --image=nginx --restart=Never -l app=webapp --dry-run=client -o yaml  | Creates Pod  |
| kubectl run nginx-job --image=nginx --restart=OnFailure --dry-run=client -o yaml  | Creates Job  |
| kubectl run nginx-job --image=nginx --restart=OnFailure --schedule=***** --dry-run=client -o yaml  | Creates CronJob  |
| kubectl run nginx-deployment --image=nginx --dry-run=client -o yaml  | Creates Deployment  |
| kubectl create deployment --image=nginx nginx-deployment --dry-run=client -o yaml  | Creates Deployment  |
| kubectl scale deployment/nginx-deployment --replicas=3 | Scale |
| https://kubernetes.io/docs/reference/kubectl/conventions/ | Reference Links |

```diff
# Pod: Smallest unit of deployment
+ Service: It is just like a viritual service inside the cluster, groups a set of related pods and provides an 
+ interface to other pods to communicate.
! Kublet: It acts like an agent, whose responsiblity is to create a pod on an node and report to kube-api-server
- Scheduler: It decides on which node the pod has to be created based on node ranks ... 
! kube-proxy: It is a daemon-set, responsible to Maintain IP-Table rules for each service, to forward traffic between the pods across the cluster.
https://kubernetes.io/docs/concepts/cluster-administration/logging/
```

```
kubectl get componentstatuses
kubeclt get pods --show-labels --selector label1=value1,label2=value2,label3=value3
kubectl get pods --show-labels | grep labelname=labelvalue | wc
kubectl get all --show-labels --no-headers | grep prod | wc -l
kubectl describe node/node01 | grep -A5 -B5 Taint
kubectl describe pod/mypod | grep -A100 Events
kubectl get pods --v=8
kubectl expose deployment hr-web-app --type=NodePort --port=8080 --name=hr-web-app-service --dry-run -o yaml
> hr-web-app-service.yaml
kubectl config view --kubeconfig=my-kube-config -o jsonpath="{.users[*].name}" > /opt/outputs/users.txt
k get pv --sort-by=.spec.capacity.storage > temp.txt
kubectl get pv --sort-by=.spec.capacity.storage -o=custom-columns=NAME:.metadata.name,CAPACITY:.spec.capacity.storage 
> /tmp.txt

kubectl drain node02 --ignore-daemonsets
**Note: error: cannot delete Pods not managed by ReplicationController, ReplicaSet, Job, DaemonSet or StatefulSet (use --force to override):

++++ worker nodes upgrade+++++
Run the commands: apt install kubeadm=1.17.0-00 and then apt install kubelet=1.17.0-00 and then kubeadm upgrade node config --kubelet-version $(kubelet --version | cut -d ' ' -f 2)

-- renew cert 
openssl x509 -req -in /etc/kubernetes/pki/apiserver-etcd-client.csr -CA /etc/kubernetes/pki/etcd/ca.crt -CAkey /etc/kubernetes/pki/etcd/ca.key -CAcreateserial -out /etc/kubernetes/pki/apiserver-etcd-client.crt


$.status.containerStatuses[?(@.name=="redis-container")].restartCount
kubectl config view --kubeconfig=my-kube-config -o jsonpath="{.contexts[?(@.context.user=='aws-user')].name}" > /tmp.txt

```

## k8s Commands
```
a) kubectl get pods -o=custom-columns='NAME:.metadata.name,IMAGE:.spec.containers[*].image' -n kube-system --no-headers
b) kubectl get pods -o=jsonpath='{range .items[*]} {.metadata.name} {"\t"} {.spec.containers[*].image} {"\n"} {end}' 
-n kube-system
c) kubectl run nginx-deployment --image=nginx --record
kubectl rollout history deployment nginx-deployment
d) ------new user creation ---------
d.1) create CertificateSigningRequest for new User nick
d.2) kubectl certificate approve nick-csr
d.2) kubectl create role developer --resource=pods --verb=create,update,list,get,delete --namespace=dev
d.3) kubectl create rolebinding developer-role-binding --role=developer --user=nick --namespace=dev --dry-run -o yaml
d.4) kubectl auth can-i update pods --namespace=dev --as=nick
e) kubectl run --generator=run-pod/v1 nginx-pod --image=nginx
f) kubectl expose pod nginx-pod --name=nginx-svc --port=80 --target-port=80 --type=ClusterIP
g) systemctl status kubelet or service kubelet status
h) kubectl create configmap app-config --from-literal=APP_COLOR=blue --from-literal=TYPE=DEV --dry-run -o yaml
   kubectl create configmap app-config --from-file=app_config.properties --dry-run -o yaml
i) kubectl create serviceaccount my-srv-account 
j) kubectl create clusterrole developer --resource=persistentvolumes --verb=list --namespace=dev
   kubectl create clusterrolebinding developer-binding --clusterrole=developer --serviceaccount=default:my-srv-account
k) kubectl run my-busybox --image=busybox:1.28 --rm -it sh 
   nc -z -v -w 2 google.com:80
l) kubectl config set-context --current --namespace=dev /// switch between namespaces
m) journalctl -u kubelet -f

```

## Pods spec
```diff
#|   kubectl explain pod.spec --recursive
#|
+|   apiVersion: v1
+|   kind: Pod
+|   metadata:
+|     name: my-pod
!|     namespace: dev
+|     labels:
+|       app: my-pod
+|   spec:
#|     nodeName: node-01
#|     schedulerName: default-scheduler
#|     serviceAccount: default
-|     securityContext:
-|       runAsUser: 5000
-|       runAsGroup: 5000
-|       capabilities:
-|         add: ["MAC_ADMIN"]
-|     volumes:
-|     - name: my-vol
-|       emptyDir: {}
+|     containers:
+|     - name: my-container
+|       image: hello-world
-|       command: ["sh", "-c", "sleep 10m"]
-|       ports:
-|       - containerPort: 8080  
#|       resources:
#|         requests:
#|           memory: "500Mi"
#|           cpu: 0.5
#|         limits:
#|           memory: "1Gi"
#|           cpu: 1
-|       volumeMounts:
-|       - name: my-vol
-|         mounthPath: /data/hello
-|       securityContext:
-|         allowPrivilegeEscalation: false

```
## Pods - Volume Mount to host directory
```diff
+|   apiVersion: v1
+|   kind: Pod
+|   metadata:
+|     name: my-pod
!|     namespace: dev
+|     labels:
+|       app: my-pod
+|   spec:
#|     nodeName: node-01
#|     schedulerName: default-scheduler
-|     volumes:
-|     - name: my-vol
-|       hostPath: 
-|         path: /tmp/test
-|         type: DirectoryOrCreate
+|     containers:
+|     - name: my-container
+|       image: hello-world
+|       command: ["sh", "-c", "sleep 10m"]
+|       ports:
+|       - containerPort: 8080  
-|       volumeMounts:
-|       - name: my-vol
-|         mounthPath: /tmp/test
-|         readOnly: true
```
- :point_right: [ k8s-Scheduling ](k8s-scheduling.md/)
- :point_right: [ k8s-Networking ](k8s-Networking.md/)
- :point_right: [ k8s-security.md ](k8s-security.md/)

