+++
date = '2021-05-22'
tags = ['published']
title = 'Kubernetes'
url = '/kubernetes'
+++

These notes are from when I read a bit of [Kubernetes Up & Running](https://www.oreilly.com/library/view/kubernetes-up-and/9781492046523/), so they might be outdated. Recently one of my goals has become to learn Kubernetes more in-depth, as part of it, this will be updated regularly. **Date: 2024.08.27**

---

## Pods

A **Pod** is the basic execution unit of a Kubernetes application. Each Pod represents a part of aworkload that is running on your cluster. It represents one or more application containers.

Containers within a Pod share the same IP address and port space; they also run on the same Node.

These containers share resources like:

* Shared storage, as Volumes
* Networking, as unique cluster IP address
* Information about how to run each container, such as the container image version or specific ports to use

## Services

A **Service** is an abstraction which defines a logical set of Pods and a policy by which to access them. They allow loose coupling between dependent Pods.

Services are defined using YAML or JSON, and the targeted Pods are usually determined by a *LabelSelector*. When `selector` is not defined, the corresponding Endpoint object won't be created, also a Label may not be defined when explicitly using `type: ExternalName`.

Services are also required to expose Pods outside of the Cluster. These Pods can be exposed in different ways depending on the `type` in the ServiceSpec:

* ClusterIP (default) - exposes the Service on an internal IP in the cluster. Then the service is only reachable within the Cluster.
* NodePort - exposes the Service on the same port of each Node in the cluster using NAT. Nodes become available using `<NodeIP>:<NodePort>`.
* LoadBalancer - Creates an external load balancer with a fixed external IP to the Service.
* ExternalName - Maps the Serivce to the contents of the `externalName` (i.e. `foo.bar.example.com`).

## Control Plane

Coordinates the cluster.

## Nodes

A **Node** is a worker that runs an application and can be a VM or a physical computer. These are managed by the **Master** and can have multiple **Pods**.

Each Node runs:

* A **kubelet**, an agent for managing the node.
* A **Container Runtime** like `containerd` or `docker`.

# Deployments

## Module 2 - Deploy an app

### Step 2 - Create a Deployment

````bash
kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1
# Get deployments
kubectl get deployments
# Start proxy
kubectl proxy
````

## Create a deployment

1. Use `kubectl create`

````bash
kubectl create deployment hello-node --images=k8s.gcr.io/echoserver:1.4
# List deployments
kubectl get deployments
# List pods
kubectl get pods
# List events
kubectl get events
# View configuration
kubectl config view
````

## Create a Service

By default Pods are only accessible by their internal IPs, to expose the Pods you need to create a Service.

1. Expose the Pod using the `kubectl expose` command.

````bash
# LoadBalancer indicates this should be exposed outside of the cluster
kubectl expose deployment hello-node --type=LoadBalancer --port=8080
# View Services
kubectl get services
````

2. Normally an IP would be used to access the Service, on Minikube it can be accessed with `minikube service`.

````bash
minikube service hello-node
````

### Cleanup

````bash
kubectl delete service hello-node
kubectl delete deployment hello-node
````

## Minikube

````bash
minikube version
minikube start
kubectl version
kubectl cluster-info
kubectl get nodes
````

### Addons

1. List addons

````bash
minikube addons list
# Enable metrics-server
minikube addons enable metrics-server
# View the Pod and Service you created
kubectl get pod,svc -n kube-system
# Disable metrics-server
minikube addons disable metrics-server
````

## Cheatsheet

* `kubectl get` - list resources
* `kubectl describe` - show detailed information about a resource
* `kubectl logs` - print the logs from a container in a pod
* `kubectl exec` - execute a command on a container pod. Example: `kubectl exec kubernetes-bootcamp-57978f5f5d-zpk6t -- env`

## Reference Links

* https://kubernetes.io/docs/tutorials/kubernetes-basics/expose/expose-intro/
* https://dev.to/7h33mp7ym4n/set-sail-with-kubernetes-the-definitive-guide-for-new-captains-319a #to-read
