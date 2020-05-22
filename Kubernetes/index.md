
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
