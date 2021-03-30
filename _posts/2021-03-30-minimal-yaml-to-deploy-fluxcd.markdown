```
---
apiVersion: v1
kind: Namespace
metadata:
  name: flux
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: flux
  namespace: flux
spec:
  replicas: 1
  selector:
    matchLabels:
      name: flux
  strategy:
    type: Recreate
  template:
    metadata:
      annotations:
        prometheus.io/port: "3031" # tell prometheus to scrape /metrics endpoint's port.
      labels:
        name: flux
    spec:
      serviceAccountName: flux
      volumes:
      - name: git-key
        secret:
          secretName: flux-git-deploy
          defaultMode: 0400 # when mounted read-only, we won't be able to chmod
      - name: git-keygen
        emptyDir:
          medium: Memory
      - name: ssh-config
        configMap:
          name: flux-ssh-config
      containers:
      - name: flux
        image: fluxcd/flux:1.14.2
        imagePullPolicy: IfNotPresent
        resources:
          requests:
            cpu: 50m
            memory: 64Mi
        ports:
        - containerPort: 3030 # informational
        livenessProbe:
          httpGet:
            port: 3030
            path: /api/flux/v6/identity.pub
          initialDelaySeconds: 5
          timeoutSeconds: 5
        readinessProbe:
          httpGet:
            port: 3030
            path: /api/flux/v6/identity.pub
          initialDelaySeconds: 5
          timeoutSeconds: 5
        volumeMounts:
        - name: git-key
          mountPath: /etc/fluxd/ssh # to match location given in image's /etc/ssh/config
          readOnly: true # this will be the case perforce in K8s >=1.10
        - name: git-keygen
          mountPath: /var/fluxd/keygen # to match location given in image's /etc/ssh/config
        - name: ssh-config
          mountPath: /root/.ssh
        args:
        - --memcached-service=
        - --ssh-keygen-dir=/var/fluxd/keygen
        - --git-url={{ your.gerrit.server:29418 }}
        - --git-branch=main
        - --git-path=manifests
        - --git-label=flux
        - --git-user=Flux
        - --git-email=fluxcd_no_reply@dom.com
        - --listen-metrics=:3031
---
apiVersion: v1
kind: Secret
metadata:
  name: flux-git-deploy
  namespace: flux
type: Opaque
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: memcached
  namespace: flux
spec:
  replicas: 1
  selector:
    matchLabels:
      name: memcached
  template:
    metadata:
      labels:
        name: memcached
    spec:
      containers:
      - name: memcached
        image: memcached:1.5.15
        imagePullPolicy: IfNotPresent
        args:
        - -m 512   # Maximum memory to use, in megabytes
        - -I 5m    # Maximum size for one item
        - -p 11211 # Default port
        ports:
        - name: clients
          containerPort: 11211
        securityContext:
          runAsUser: 11211
          runAsGroup: 11211
          allowPrivilegeEscalation: false
---
apiVersion: v1
kind: Service
metadata:
  name: memcached
  namespace: flux
spec:
  ports:
    - name: memcached
      port: 11211
  selector:
    name: memcached
---
apiVersion: v1
kind: ServiceAccount
metadata:
  labels:
    name: flux
  name: flux
  namespace: flux
---
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRole
metadata:
  labels:
    name: flux
  name: flux
rules:
  - apiGroups: ['*']
    resources: ['*']
    verbs: ['*']
  - nonResourceURLs: ['*']
    verbs: ['*']
---
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  labels:
    name: flux
  name: flux
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: flux
subjects:
  - kind: ServiceAccount
    name: flux
    namespace: flux
---
apiVersion: v1
data:
  known_hosts: |
    [your.gerrit.server]:29418,[your.git.server.ip]:29418 ssh-rsa AAAAzzzz
kind: ConfigMap
metadata:
  name: flux-ssh-config
  namespace: flux
```
After `apply`,
```
kubectl -n flux wait --for=condition=Ready pod --all
kubectl -n flux logs deployment/flux |grep identity.pub |awk '{print $4" "$5}'
```
and add that public key to your repo
