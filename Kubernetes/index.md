```diff
# Pod: Smallest unit of deployment
+ Service: It is just like a viritual service inside the cluster, groups a set of related pods and provides an 
+ interface to other pods to communicate.
! Kublet: It acts like an agent, whose responsiblity is to create a pod on an node and report to kube-api-server
- Scheduler: It decides on which node the pod has to be created based on node ranks ... 
! kube-proxy: It is a daemon-set, responsible to Maintain IP-Table rules for each service, to forward traffic between the pods across the cluster.

```


## Pods Scheduling

- ####   Scheduling New Pods Manually
```diff
##   Pod_Manual_Scheduling

+|   apiVersion: v1
+|   kind: Pod
+|   metadata:
+|     name: nginx
!|     namespace: dev
+|     labels:
+|       app: nginx
+|   spec:
+|     containers:
+|     - name: nginx
+|       image: nginx
-|       ports:
-|       - containerPort: 8080  
#|     nodeName: node-01
#|     schedulerName: default-scheduler

```

- #### Scheduling Existing Pods Manually
```diff
##   Manual_Scheduling Existing Pods

+|   apiVersion: v1
+|   kind: Binding
+|   metadata:
+|     name: nginx
+|   target:
+|     apiVersion: v1
+|     kind: Node
+|     name: node-02

!|   curl --header "Content-Type:application/json" 
!|        --request POST 
!|        --data '{"apiVersion":"v1", "kind": "Binding" ... }
!|        http://$IP/api/v1/namespaces/default/pods/$PODNAME/binding/

```

- ####   Taint => Node
```diff
##   Taints a Node

+| kubectl taint nodes node-name key=value:taint-effect

!| taint-effect => ( NoSchedule, PreferNoSchedule, NoExecute )

Example:
+| kubectl taint nodes node-01 app=blue:NoSchedule

```

- ####   Tolerations => Pod
```diff
+|   apiVersion: v1
+|   kind: Pod
+|   metadata:
+|     name: nginx
!|     namespace: dev
+|     labels:
+|       app: nginx
+|   spec:
+|     containers:
+|     - name: nginx
+|       image: nginx
-|     tolerations:
-|     - key: "app"
-|       operator: "Equals"
-|       value: "blue"
-|       effect: "NoSchedule"

```

- ####   NodeSelector

```diff

#|  kubectl label nodes <node-name> <label-key>=<label-value> 
Example:

+|  kubectl label nodes node-01 size=Large

+|   apiVersion: v1
+|   kind: Pod
+|   metadata:
+|     name: nginx
!|     namespace: dev
+|     labels:
+|       app: nginx
+|   spec:
+|     containers:
+|     - name: nginx
+|       image: nginx
-|     nodeSelector:
-|       size: Large

!| Limitations: Uses single Label & selector, wont support multiple labels
+| %Solution%: Node Affinity

```

- ####   Node Affinity

