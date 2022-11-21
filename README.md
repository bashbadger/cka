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
- Create and upgrade a cluster
- Understand HA topologies
- Back up and restore etcd

### Workloads & Scheduling (15%)

- Scale a Deployment
- Roll out and roll back Deployment updates
- Create ConfigMaps and Secrets, different sources and types
- Understand resource boundaries on scheduling (requests, limits)
- Manage objects with imperative and declarative approach
- High level understanding of templating tools: `kustomize`, `yq`, `helm`

### Services & Networking (25%)

- Understand the purpose of a Service
- Understand the difference between `ClusterIP`, `NodePort`, and `LoadBalancer`
- Understand the difference between Service and Ingress

### Storage (10%)

- Understand the need and use cases for a volume
- Define and consume volumes
- Understand mechanics of defining and consuming a PersistentVolume
- Difference between static and dynamic provisioning of a PersistentVolume

### Troubleshooting (30%)

- Understand logging on a theoretical level 
- Understand accessing container logs
- Install and use a metrics server
- Troubleshoot applications
- Troubleshoot clusters
