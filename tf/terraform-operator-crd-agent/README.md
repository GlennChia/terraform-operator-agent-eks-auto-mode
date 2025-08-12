# Create the Terraform Operator Agent Pool

> [!CAUTION]
> This demo uses `terraform_remote_state` data source in [data.tf](./data.tf) to reference outputs from the previous directories for simplicity. In live environments using HCP Terraform/Terraform Enterprise, you should instead use the [tfe_outputs data source](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/outputs), which properly integrates with Terraform workspace architecture, provides better security through access controls, and enables cleaner cross-workspace dependencies.

Step 1: Copy [terraform.tfvars.example](./terraform.tfvars.example) to `terraform.tfvars` and change the environment variables accordingly.

Step 2: Run an apply, review the plan output, and approve the plan accordingly.

> [!NOTE]
> [01-k8s.tf](./01-k8s.tf) configures the Terraform agent pool with `minReplicas` as `5` and `maxReplicas` as `50`. These settings are compatible with agents running on HCP Terraform Premium, which supports up to `100` self-hosted agents. If you are using HCP Terraform Standard or Plus, you should modify these values to align with your plan's agent limits.

```bash
terraform init
terraform apply
```