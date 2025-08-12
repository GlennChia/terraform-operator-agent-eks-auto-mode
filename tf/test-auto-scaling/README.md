# Create Terraform workspaces for testing

> [!CAUTION]
> This demo uses `terraform_remote_state` data source in [data.tf](./data.tf) to reference outputs from the previous directories for simplicity. In live environments using HCP Terraform/Terraform Enterprise, you should instead use the [tfe_outputs data source](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/outputs), which properly integrates with Terraform workspace architecture, provides better security through access controls, and enables cleaner cross-workspace dependencies.

Step 1: Configure HCP Terraform credentials. Refer to the [tfe_provider authentication docs](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs#authentication) for the various token options and guidance. For example:

```bash
export TFE_TOKEN=example
```

Step 2: Copy [terraform.tfvars.example](./terraform.tfvars.example) to `terraform.tfvars` and change the environment variables accordingly. GitHub credentials can use a [personal access tokens](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens). This token needs sufficient permissions to create, delete repositories, and write files to the repository.

> [!CAUTION]
> In a live environment, it is not good practice to directly pass the GitHub token. Instead, sensitive credentials should be securely stored and accessed using solutions like HashiCorp Vault, which provides encrypted storage and access controls capabilities.

Step 3: Run an apply, review the plan output, and approve the plan accordingly.

```bash
terraform init
terraform apply
```
