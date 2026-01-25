# Commands für Kubectl



| Command                                                                                                                                                           | Bereich           | Kommentar                                              |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------- | ------------------------------------------------------ |
| `kubectl describe pod/<Podname>`                                                                                                                                  | debug             | öffnet das aktuelle log des Pods                       |
| `kubectl port-forward svc/<svc-Name> 5000:5000 -n default`                                                                                                        | network           | Portforwarding um verbindung lokal zu testen           |
| kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" \| % { [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($_)) } | argocd            | Gibt das initial Passwort aus für den Admin im Argo CD |
| kubeseal --fetch-cert `<br>  --controller-name=sealed-secrets `<br>  --controller-namespace=kube-system `<br>  > sealed-secrets-cert.pem<br>                      | Secret management | Legt ein pem-Zertifikat ab, vom sealed-secret-service  |
|                                                                                                                                                                   |                   |                                                        |
