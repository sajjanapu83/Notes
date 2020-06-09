
#### Setup basic authentication on kubernetes ( kubeadm )

```diff
Edit the static pod 

apiVersion: v1
kind: Pod
metadata:
  name: kube-apiserver
  namespace: kube-system
spec:
  containers:
  - command:
    - kube-apiserver
    - --authorization-mode=Node,RBAC
      <content-hidden>
-   - --basic-auth-file=/tmp/users/user-details.csv
```
## Digital Certs

```diff
!| Generate Keys 
   openssl genrsa -out ca.key 2048
!| Request Certificate Signing Request
   openssl req -new -key ca.key -subj "/CN=Kubernetes-ca" -out ca.csr
!| Sign Certificate
   openssl x509 -req -in ca.csr -signkey ca.key -out ca.crt

```
