#!/usr/bin/env bash
# Create certificate/key pair for RBAC testing of Role|ClusterRole
# and RoleBinding|ClusterRoleBinding functionality.
# Requires existing k8s (kubeadm) cluster.
# You can alternatively use username/password authentication.
# Creation of a user is *not* required for CKA.

[[ -z $1 ]] || [[ $# -gt 1 ]] && { echo "Usage: ${0##*/} <user>" && exit 1 ; }

name="$1"
crtdir="./certs"
key="${name}.key"
csr="${name}.csr"
crt="${name}.crt"
subj="/CN=${name}"
cacrt="/etc/kubernetes/pki/ca.crt"
cakey="/etc/kubernetes/pki/ca.key"

[[ ! -d "$crtdir" ]] && { mkdir "$crtdir" || exit 1 ; }
cd "$crtdir"

openssl genrsa -out "$key" 2048 &>/dev/null
openssl req -new -key "$key" -out "$csr" -subj "$subj" &>/dev/null
# sudo needed to sign with cluster CA
sudo openssl x509 -req -in "$csr" -CA "$cacrt" -CAkey "$cakey" -CAcreateserial \
                  -out "$crt" -days 365 &>/dev/null

[[ $? -ne 0 ]] && { echo openssl failure && exit 2 ; }

echo "Certificate and key pair created for user $name:"
ls -1 "${PWD}/${name}."{crt,key}
echo "Signed by cluster CA." && echo

echo "You now probably want to create the user and context in your cluster:"
echo "kubectl config set-credentials $name \
--client-certificate=${crtdir}/${crt} \
--client-key=${crtdir}/${key}"
echo "kubectl config set-context ${name}-context \
--cluster=kubernetes --user=${name}"
