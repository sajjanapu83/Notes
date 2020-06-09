## K8s Offical docs
- https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/
- 
| First Header  | Second Header |
| ------------- | ------------- |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  |

```diff
# Pod: Smallest unit of deployment
+ Service: It is just like a viritual service inside the cluster, groups a set of related pods and provides an 
+ interface to other pods to communicate.
! Kublet: It acts like an agent, whose responsiblity is to create a pod on an node and report to kube-api-server
- Scheduler: It decides on which node the pod has to be created based on node ranks ... 
! kube-proxy: It is a daemon-set, responsible to Maintain IP-Table rules for each service, to forward traffic between the pods across the cluster.
https://kubernetes.io/docs/concepts/cluster-administration/logging/
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

