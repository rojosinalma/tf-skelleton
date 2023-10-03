# Terraform

This repository contains the terraform structure necessary to deploy our Infra with different providers, tools and resources.

To automate these deployments we're using [Spacelift](https://42xai.app.spacelift.io) with different stacks, not necessarily tied to a single cloud provider or tool.

## Dependencies

* [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) 1.5.7 (or latest OSS version)
* [Pre-commit](https://pre-commit.com) 3.4.0+

Optional:

* [Spacectl](https://github.com/spacelift-io/spacectl) 0.27.0
