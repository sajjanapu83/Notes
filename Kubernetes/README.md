```diff
# Pod: Smallest unit of deployment
+ Service: It is just like a viritual service inside the cluster, groups a set of related pods and provides an 
+ interface to other pods to communicate.
! Kublet: It acts like an agent, whose responsiblity is to create a pod on an node and report to kube-api-server
- Scheduler: It decides on which node the pod has to be created based on node ranks ... 
! kube-proxy: It is a daemon-set, responsible to Maintain IP-Table rules for each service, to forward traffic between the pods across the cluster.

```
## Pods spec
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
-|     securityContext:
-|       runAsUser: 5000
-|       runAsGroup: 5000
-|     volumes:
-|     - name: my-vol
-|       emptyDir: {}
+|     containers:
+|     - name: my-container
+|       image: hello-world
-|       command: ["sh", "-c", "sleep 10m"]
-|       ports:
-|       - containerPort: 8080  
-|       volumeMounts:
-|       - name: my-vol
-|         mounthPath: /data/hello
-|       securityContext:
-|         allowPrivilegeEscalation: false

```
- :point_right: [ k8s-Scheduling ](k8s-scheduling.md/)
- :point_right: [ k8s-Networking ](k8s-Networking.md/)

