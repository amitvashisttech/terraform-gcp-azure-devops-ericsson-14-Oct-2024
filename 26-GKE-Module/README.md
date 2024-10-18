#### To Connect & Use GKE Cluster

#### Step 1: Install Gloud Auth Plugin & Kubernetes client urils - Kubectl
```
  yum install google-cloud-sdk-gke-gcloud-auth-plugin
  yum install kubectl
```

#### Step 2: Cloud login & Configure your project
```
 gcloud auth login
 gcloud config set project PROJECT_ID
```

#### Step 3:  Past you GKE Credentials 
```
gcloud container clusters get-credentials mygke-cluster --zone us-central1-a --project project-XXXXXXXXXXXX
```

#### Step 4: Check the Cluster Node Status 
```
 kubectl get nodes
```
```
[root@terrafrom-vm 26-GKE-Module]# kubectl get nodes 
NAME                                                STATUS   ROLES    AGE   VERSION
gke-mygke-cluster-primary-node-pool-5a41b597-2lpm   Ready    <none>   72m   v1.30.5-gke.1014001
gke-mygke-cluster-primary-node-pool-5a41b597-ph0t   Ready    <none>   97m   v1.30.5-gke.1014001
gke-mygke-cluster-primary-node-pool-9fb586fb-f4gz   Ready    <none>   73m   v1.30.5-gke.1014001
gke-mygke-cluster-primary-node-pool-9fb586fb-hb7x   Ready    <none>   96m   v1.30.5-gke.1014001
[root@terrafrom-vm 26-GKE-Module]# 
```