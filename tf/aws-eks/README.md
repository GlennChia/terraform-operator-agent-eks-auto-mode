# Create a cluster with Amazon EKS Auto Mode

Step 1: Configure AWS credentials. For example:

```bash
export AWS_ACCESS_KEY_ID=example
export AWS_SECRET_ACCESS_KEY=example
export AWS_SESSION_TOKEN=example
```

Step 2: Copy [terraform.tfvars.example](./terraform.tfvars.example) to `terraform.tfvars` and change the environment variables accordingly.

Step 3: Run an apply, review the plan output, and approve the plan accordingly.

```bash
terraform init
terraform apply
```
