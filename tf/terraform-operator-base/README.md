# Create the Terraform Operator

> [!CAUTION]
> This demo uses `terraform_remote_state` data source in [data.tf](./data.tf) to reference outputs from the previous directories for simplicity. In live environments using HCP Terraform/Terraform Enterprise, you should instead use the [tfe_outputs data source](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/outputs), which properly integrates with Terraform workspace architecture, provides better security through access controls, and enables cleaner cross-workspace dependencies.

Step 1: Run an apply, review the plan output, and approve the plan accordingly.

```bash
terraform init
terraform apply
```
