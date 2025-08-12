# Create a HCP Terraform Team and a Team Token

Step 1: Configure HCP Terraform credentials. Refer to the [tfe_provider authentication docs](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs#authentication) for the various token options and guidance. For example:

```bash
export TFE_TOKEN=example
```

Step 2: Run an apply, review the plan output, and approve the plan accordingly. The apply outputs the team token that has permissions to read workspaces and manage agent pools. This token is referenced by the Terraform Operator Agent Pool CRD.

> [!CAUTION]
> In a live environment it is not good practice to output the Terraform token. The token is output in this repo purely for demo purposes, such that readers can easily pass the token to the Terraform operator.

```bash
terraform init
terraform apply
```
