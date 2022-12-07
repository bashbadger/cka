# CKA

Notes and YAML files for CKA (Certified Kubernetes Administrator)
certification.

## Objectives

Current objectives are listed
[here](https://training.linuxfoundation.org/certification/certified-kubernetes-administrator-cka/).

Exam is based on the latest minor version (x.**y**.z).

## Task list

List of tasks and areas to be comfortable with before taking the exam.

### Cluster Architecture, Installation & Configuration (25%)

- Define RBAC rules
- Upgrade a cluster, including kubelet and kubectl
- Back up and restore etcd

### Workloads & Scheduling (15%)

- Scale a Deployment
- Roll out and roll back Deployment updates
- Create ConfigMaps and Secrets, different sources and types
- Understand resource boundaries on scheduling (requests, limits)
- Manage objects with imperative and declarative approach

### Services & Networking (25%)

- Understand the purpose of a Service
- Understand the difference between `ClusterIP`, `NodePort`, and `LoadBalancer`
- Understand the difference between Service and Ingress

### Storage (10%)

- Define and consume volumes
- Understand mechanics of defining and consuming a PersistentVolume
- Difference between static and dynamic provisioning of a PersistentVolume

### Troubleshooting (30%)

- Understand logging on a theoretical level 
- Understand accessing container logs
- Use a metrics server
- Troubleshoot applications
- Troubleshoot clusters

## Exam tips

### Kubernetes docs

Exam allows access only to the kubernetes [documentation](https://kubernetes.io/docs/).

Particularly useful pages:
- [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

### Minimal .vimrc

Minimal `~/.vimrc` to make yaml editing easier in vim:

```vim
" Already set in exam
set tabstop=2
set shiftwidth=2
set expandtab
```

### Aliases

Potentially useful aliases:

```shell
alias k='kubectl'   # already available on exam
alias kr='kubectl run'
alias kc='kubectl create'
alias ka='kubectl apply'
alias kd='kubectl delete --force'   # exam doesn't care about graceful termination
```

### Variable for --dry-run

Avoid typing `-o yaml --dry-run=client` each time you want to generate
example yaml.

```shell
export dry='-o yaml --dry-run=client'
k run nginx --image=nginx $dry > example.yaml   # example
```
