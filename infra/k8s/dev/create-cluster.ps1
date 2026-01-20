minikube start -p "semar4-dev"
    kubectl create namespace argocd
    kubectl create namespace licensetool

minikube addons enable ingress -p semar4-dev

