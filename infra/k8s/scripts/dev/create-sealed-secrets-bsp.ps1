kubectl create secret generic "<Secretname>" `
  --from-env-file="<Secretpath>" `
  -n licensetool `
  -o yaml --dry-run=client `
| kubeseal --format yaml --cert "<Certpath sealed secret.pem>" `
> "<Outputpath>"