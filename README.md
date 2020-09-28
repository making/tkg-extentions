```
cp config/authentication/dex/vsphere/cluster-template-oidc.yaml ~/.tkg/providers/infrastructure-vsphere/v0.6.6/

export OIDC_ISSUER_URL=https://10.213.173.209:30167
export OIDC_USERNAME_CLAIM=email
export OIDC_GROUPS_CLAIM=groups
export DEX_CA=$(kubectl get secret dex-cert-tls -n tanzu-system-auth -o 'go-template={{ index .data "ca.crt" }}' | base64 -D | gzip | base64) 

tkg create cluster playground -p oidc 
```