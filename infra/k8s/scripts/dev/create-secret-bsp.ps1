kubectl create secret docker-registry regcred `
    --docker-server=https://index.docker.io/v1/ `
    --docker-username="" ` # Username of Dockerhub account
    --docker-password="" ` # PAT of Dockerhub account
    --namespace=default

    # After adding your credentials, remove the comments and run the script.