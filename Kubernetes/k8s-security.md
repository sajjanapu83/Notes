
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

> Root CA certificate ( ca.crt )
```diff
+ ROOT CA
#1 Generate Keys 
   openssl genrsa -out ca.key 2048
#2 Request Certificate Signing Request
   openssl req -new -key ca.key -subj "/CN=Kubernetes-ca" -out ca.csr
#3 Sign Certificate ( self sign )
   openssl x509 -req -in ca.csr -signkey ca.key -out ca.crt
   
#4 View the certificate
   openssl x509 -in ca.crt -text -noout
```

> Client Certificates
```diff
+ KUBE-ADMIN
#1 Generate Keys 
   openssl genrsa -out admin.key 2048
#2 Request Certificate Signing Request
   openssl req -new -key admin.key -subj "/CN=Kube-admin/O=system:masters" -out admin.csr
#3 Sign with root ca Certificate 
   openssl x509 -req -in admin.csr -CA ca.crt -CAkey ca.key -out admin.crt
+ KUBE-SHCEDULAR

+ KUBE-CONTROLLER

+ KUBE-PROXY
   
```
> Server Certificates

## Kube-Config

```
apiVersion: v1
kind: Config
clusters:
  - name: my-cluster-dev
    cluster: 
      certificate-authority: ca.crt
      server: https://my-cluster-dev:6443
  - name: my-cluster-test
    cluster: 
      certificate-authority: ca.crt
      server: https://my-cluster-test:6443
context:
  - name: my-admin-dev@my-cluster-dev
    context:
      cluster: my-cluster-dev
      user: my-admin-dev
  - name: my-admin-test@my-cluster-test
    context:
      cluster: my-cluster-test
      user: my-admin-test
users:
  - name: my-admin-dev
    user:
      client-certificate: admin-dev.crt
      client-key: admin-dev.key
  - name: my-admin-test
    user:
      client-certificate: admin-test.crt
      client-key: admin-test.key
```

