
- Pods:

```diff

+|   apiVersion: v1
+|   kind: Pod
+|   metadata:
+|     name: pod-name
!|     namespace: dev
+     labels:
+       app: pod-label-name
+   spec:
+     containers:
+     - name: nginx
+       image: nginx
-       containerPort: 80       
```
