# Create the Terraform Operator Agent Pool

Step 1: Copy [terraform.tfvars.example](./terraform.tfvars.example) to `terraform.tfvars` and change the environment variables accordingly.

Step 2: Run an apply, review the plan output, and approve the plan accordingly.

> [!NOTE]
> [01-k8s.tf](./01-k8s.tf) configures the Terraform agent pool with `minReplicas` as `5` and `maxReplicas` as `50`. These settings are compatible with agents running on HCP Terraform Premium, which supports up to `100` self-hosted agents. If you are using HCP Terraform Standard or Plus, you should modify these values to align with your plan's agent limits.

```bash
terraform init
terraform apply
```