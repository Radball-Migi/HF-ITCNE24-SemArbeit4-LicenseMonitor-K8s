minikube start -p "semar4-demo"
    kubectl create namespace argocd
    kubectl create namespace licensetool

minikube addons enable ingress -p semar4-demo

kubectl apply -f "C:\Users\miguel.schneider\OneDrive - TBZ\GitHub_Repos_HF\HF-ITCNE24-SemArbeit4-LicenseMonitor-K8s\infra\k8s\apps\ingress-nginx\base\ingress-nginx-controler-lb.yaml"
kubectl -n ingress-nginx rollout status deploy/ingress-nginx-controller

