#### Step 1:  Deploy GKE Manually from the Cloud Portal. 
#### Step 2:  Connect the Cluster via Cloud Shell
#### Step 3:  Deploy Couple of Containers & Expose the same for testing. ( Follow the below command for the same.)

#### Commands: 

```
cognixiagcpoct_a39cfae3_96ba_47b@cloudshell:~ (cognixia-1607499012052)$ history 
    1  gcloud container clusters get-credentials autopilot-cluster-1 --region us-central1 --project cognixia-1607499012052
    2  kubectl get nodes 
    3  kubectl get pods 
    4  kubectl get pods -A 
    5  ls
    6  kubectl run hello-k8s --image=nginx --port=80
    7  kubectl get pods 
    8  kubectl describe pods hello-k8s
    9  kubectl get pods 
   10  kubectl get pods, nodes 
   11  kubectl get  nodes 
   12  kubectl get  pods 
   13  kubectl describe pods hello-k8s
   14  kubectl get  pods 
   15  kubectl get  pods -o wide 
   16  kubectl  expose pod hello-k8s --type=LoadBalancer
   17  kubectl get svc 
   18  kubectl run myapp --image=amitvashist7/my-colorful-nginx-app1 --port=80
   19  kubectl get svc 
   20  kubectl edit svc hello-k8s
   21  kubectl get svc 
   22  kubectl get po
   23  kubectl get no
   24  kubectl get po
   25  kubectl describe po myapp
   26  kubectl get no
   27  kubectl get po
   28  kubectl  expose pod myapp --type=LoadBalancer
   29  kubectl get svc 
   30  kubectl get po 
   31  kubectl delete pod hello-k8s
   32  kubectl exec -it myapp -- bash
   33  history 
cognixiagcpoct_a39cfae3_96ba_47b@cloudshell:~ (cognixia-1607499012052)$ 
```