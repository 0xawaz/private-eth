# Infrastructure

## Prerequisites

### Binaries

* aws-cli [installed](https://docs.aws.amazon.com/rekognition/latest/dg/setup-awscli-sdk.html)
* Kubernetes client (kubectl) [installed](https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl) with [auto-completion](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#kubectl-autocomplete)
  * Alias ``kubectl`` with ``kc`` while keeping bash completion add the following line in **~/.bash_aliases** :

    ```sh
    which kubectl > /dev/null && alias kc='kubectl' && source <(kubectl completion bash) && complete -F __start_kubectl kc
    ```
* Terraform [installed](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
* Helm client [installed](https://docs.helm.sh/using_helm/#installing-helm) to provision packaged kubernetes services

* Optional
  * K9s [installed](https://k9scli.io/topics/install) to browse/edit/delete your kubernetes resources.
  * Kcx [installed](https://github.com/ahmetb/kubectx) to manage multiple clusters.


### Setup Credentials

#### IAM Setup

For a secured environment, you need a fine grained IAM policy following the least priviledge principle, for example for terraform you can create:
- IAM role that allows readOnly, this role can be affected to interns or new hires who do not qualify yet to edit or delete resources.
- IAM role for that allows read and write, this can be affected to junior devops or any user who can create but not delete resources.
- Admin IAM role which can be affected to more senior devops that are more qualified to perform deletetion actions.

For demo purposes, we will use an administrator IAM user (different from root account), this is not recommended for production environment. We recommend to use [IAM Identity Center](https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html).

#### AWS Credentials

1. Connect to aws console, create an IAM user, grant necessary permissions according to your organization IAM policy and generate AWS access key.

2. Save content to ~/.aws/credentials

## IaC with terraform

### Environment Setup

```sh
mkdir -p ~/projects
cd ~/projects
git clone git@github.com:0xawaz/private-eth.git
# choose the environment you wish to work on, possible values are: staging|prod
export ENV=staging
```

### S3 bucket for terraform backend

```bash
REGION=$(aws configure get region)
aws s3api create-bucket --bucket 0xawaz-tfstate --region $REGION
```

### EKS Cluster

```sh
cd ~/projects/private-eth/infra/terraform/eks-cluster/src/
terraform init
terraform workspace new $ENV
terraform workspace select $ENV
terraform plan --var-file=../vars/${ENV}.tfvars
terraform apply --var-file=../vars/${ENV}.tfvars
```

### Kubernetes config

Now that the cluster is up and running, we can setup kubectl/k9s:

For demo purposes we will perform the steps manually, this can be automated.

```bash
export CLUSTER_NAME=$(terraform output cluster_name)
export KUBECONFIG="${HOME}/.kube/config"
aws eks update-kubeconfig --name $CLUSTER_NAME
KUBE_CONTEXT=$(kubectl config current-context)
kubectl config use-context $KUBE_CONTEXT
```

Note that we are using one cluster per config, so our KUBECONFIG points at a single file.

At this point you can use k9s to monitor and visualize the cluster resources and ktx to navigate clusters if you have multiple ones.

### Conclusion

Our infrastructure is a minimal design with simple IaC implementation to demonstrate EKS creation with minimal effort. We used terraform official modules and also direct resources according to need and to demonstrate different possibilities. 

For production environment, we want to control all the configurations especially cross modules versions. We recommend to create our own modules and explicitly specify all resources like: security groups, cni, acl, nat gateway ...
If we choose to use official terraform modules, we need to keep up with the changelog and be aware of any breaking changes.

## References

* Terraform [changelog](https://github.com/hashicorp/terraform/blob/master/CHANGELOG.md)
* Terraform [aws](https://registry.terraform.io/providers/hashicorp/aws/latest) provider [changelog](https://github.com/hashicorp/terraform-provider-aws/blob/master/CHANGELOG.md)

* Terraform modules
  * [terraform-aws-eks](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest)
  * [terraform-aws-vpc](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)
