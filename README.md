# Private Ethereum Network

## Introduction

This project aims to create a robust infrastructure for Private Etheurem Network with Proof-of-Stake using DevOps practices.

## DevOps Specification

### Deploy
- Private Ethereum network should have at least three containerized nodes.
- All nodes should be properly communicating, syncing, and secured with appropriate configurations.

### Maintain
- Setup should be automated and modular and scalable, allowing easy modifications and expansions.
- Use Infrastructure as Code (IaC) tools like Terraform and GitOps tools like ArgoCD.

### Monitor
- Implement monitoring for the Ethereum nodes using tools such as Prometheus and Grafana.
- Set up alerts for key metrics, ensuring that the network's health and performance are closely tracked.

## Implementation

### Build

[build/README.md](build/README.md)

### Infra

[infra/README.md](infra/README.md)

### Deploy

[deploy/README.md](deploy/README.md)

## Acknowledgment

I would like to acknowledge the contributions of the open-source community, as this Private Ethereum Network projects is based on the following projects:

* [Ethereum Foundation](https://github.com/ethereum/go-ethereum)
* [Prysmatic Labs](https://github.com/prysmaticlabs/prysm)