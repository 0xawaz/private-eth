# Private Ethereum Network on Kubernetes Cluster (EKS)

## Project structure

```bash
tree -L 2
.
├── README.md
├── argocd
│   ├── apps
│   ├── argocd-ingress.yaml
│   ├── install.yaml
│   └── project.yaml
├── eth
│   ├── beacon
│   ├── execution
│   └── validator
├── monitor
│   ├── crds
│   ├── exporters
│   ├── helm
│   └── misc
├── system
│   ├── cluster-autoscaler.yaml
│   └── metrics-server.yaml
└── web
    ├── cert-manager
    └── nginx-ingress
```

## Getting Started

Please follow these instructions to deploy Ethereum Private Network up and running in Kuberenetes Cluster:

```sh
# get project
git clone git@github.com:0xawaz/private-eth.git
cd private-eth/deploy

# deploy all resources
./scripts/deploy-all-manifests.sh -m apply

# monitor and watch resources using k9s
k9s

# cleanup
# This is wip, to allow a safer way for cleanup
./scripts/deploy-all-manifests.sh -m delete
```

Now Ethereum Private Network is up an running.

Manage ArgoCD apps [argocd.0xawaz.com](https://argocd.0xawaz.com).

Observe Platform Metrics and logs [monitoring.0xawaz.com](https://monitoring.0xawaz.com).

You can also monitor eth, monitor and web components behavior using k9s or kubectl commands.

## Future Work

* Deployment
    * Add Grafana dashboards for our private ethereum network.
    * Add priorityClass, tune k8s nodes with daemonsets.

* Automation (CI/CD)
    * Add more github workflows to include argocd apps and replace bash scripts.
    * Set stateless config for multiple environments (dev/staging/prod).

* Performence
    * Loadtest our private network to check limitations and tune resources.

* Security
    * Add advanced network config for geth, beacon-chain and validator to ensure secure communication and exposure
    * Scan all used and created docker images and binaries and patch vulnerabilities if exists.
    * Use AWS Secrets Manager to store network related secrets.

## References

* [Prometheus Helm Charts](https://github.com/prometheus-community/helm-charts)
* [Grafana Helm Charts](https://github.com/grafana/helm-charts)
* [Ingress Nginx Controller](https://github.com/kubernetes/ingress-nginx)
* [Cert Manager](https://github.com/cert-manager/cert-manager)


