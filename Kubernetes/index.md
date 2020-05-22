
- Pods:
![#1589F0](https://via.placeholder.com/15/1589F0/000000?text=+) `Manual Scheduling New Pods`
- ####   Manual Scheduling New Pods
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

- #### Manual Scheduling Existing pods
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
