
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
#|     nodeName: node-01

```

| Attempt | #1 | #2 |
| :---: | :---: | :---: |
| ```diff Seconds<br /> one ``` | 301 | 283 |
