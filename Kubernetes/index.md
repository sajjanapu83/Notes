
- Pods:

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
-|       ports:
-|       - containerPort: 8080  
#|     nodename: node-01

```
