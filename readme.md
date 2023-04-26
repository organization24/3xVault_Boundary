## Simple PoC project that demonstrates the usage of Boundary workers alongside Boundary HCP product.

-----

![Boundary Logo](https://raw.githubusercontent.com/hashicorp/boundary/main/boundary.png)


### What is it : 

  The project is based on [3xVault](https://github.com/martinhristov90/3xVault) repository.

  The project creates 3 Vault nodes in private subnets in 3 different AWS regions. Additionally a Boundary worker is created within each region to provide connectivity to the 3 Vault nodes in particular AWS region. 
  HCP Boundary is used for establishing connections via Boundary workers.

### Simple diagram :

![Diagram](https://lucid.app/publicSegments/view/e4705799-21ff-4570-a87c-c8d04be7475b/image.png)

### Prerequisites :

  - Having AWS account with the necessary permissions.
  - HCP account.
  - Boundary HCP cluster.
  - Terraform v1.4.4 or higher.

### Usage :

  - Clone the repository : `git clone https://github.com/organization24/3xVault_Boundary.git`.
  - Change into its directory : `cd 3xVault_Boundary`.
  - Create `terraform.tfvars` file, example of how it should look like can be found below. While creating `terraform.tfvars` file specify Vault version newer than 1.6.0, so "Integrated Storage Cloud Auto Join" is available.
  - Put your Vault enterprise license in a file named `license_vault.txt` in the root directory of this project.
  - Initialize Terraform providers : `terraform init`.
  - Execute Terraform plan and apply : `terraform plan` and `terraform apply`.
  - The IPs of the Boundary worker nodes are printed as Terraform outputs. If direct SSH connection is needed to the Boundary workers, private SSH keys can be found at `private_keys_boundary/` folder in the root of this project.
  - Each node located in `a1` AZ is the active node for the particular Vault cluster. The `VAULT_TOKEN` env variable is automatically populated for the active node of each cluster.
### How to connect to the Vault nodes using Boundary:

  - Set HCP Boundary address by executing the following command the `export BOUNDARY_ADDR=https://CLUSTER_ID_HERE.boundary.hashicorp.cloud`.
  - Login to the HCP Boundary for the desired region, following examples can be used for respective regions:
    * US region - `boundary authenticate password -scope-id=SCOPE_ID -auth-method-id=AUTH_METHOD_ID -login-name=administrator-us`.
    * EU region - `boundary authenticate password -scope-id=SCOPE_ID -auth-method-id=AUTH_METHOD_ID -login-name=administrator-eu`.
    * AP region - `boundary authenticate password -scope-id=SCOPE_ID -auth-method-id=AUTH_METHOD_ID -login-name=administrator-ap`.

    `SCOPE_ID` and `AUTH_METHOD_ID` variables are printed as Terraform Outputs. Those examples with correct values replaced are also printed as Terraform Outputs.
  - Login to the desired region, following examples can be used for respective regions:
    * US region - `boundary connect ssh -target-scope-name=3xVaultProject -target-name=targetUSregion`.
    * EU region - `boundary connect ssh -target-scope-name=3xVaultProject -target-name=targetEUregion`.
    * AP region - `boundary connect ssh -target-scope-name=3xVaultProject -target-name=targetAPregion`.
    
    The `-host-id=` flag can be used to log in to desired host, otherwise Boundary is going to pick host at random. For example `-host-id=` can be set to `3xVaultEU0`, `3xVaultEU1` or `3xVaultEU2` for EU region.
### TODO :

 - [ ] Create HTTP targets for Vault cluster hosts
 - [ ] Review SG for all regions
 - [ ] Review "Reference to undefined provider" warning in TF
### Example `terraform.tfvars` :

  ```
  clusters = {
    "us" = { region = "us-east-2", vpc_cidr = "192.168.0.0/24", vault_version = "1.10.3+ent-2", vault_ec2_type = "small"},
    "ap" = { region = "ap-south-1", vpc_cidr = "192.168.100.0/24", vault_version = "1.7.7+ent", vault_ec2_type = "small"},
    "eu" = { region = "eu-west-1", vpc_cidr = "192.168.200.0/24", vault_version = "1.9.6+ent-2", vault_ec2_type = "small"}
  }  
  # For all versions of "vault-enterprise" package, run "apt list -a vault-enterprise" after installing the Hashicorp repo.
  # The "vault_ec2_type" variable should be one of the following types - small or large. Small corresponds to "t3.small" while "large" corresponds to "t3.large".

  # Boundary config section
  boundary_version                = "0.12.2+hcp-1" # Use "apt search boundary" to find all versions
  boundary_ec2_type               = "small" # "small" or "large". Size of the EC2 instance of the Boundary worker
  addr                            = "https://CLUSTER_ID.boundary.hashicorp.cloud" # Address for HCP Boundary cluster
  auth_method_id                  = "ampw_NUMBER" # Admin login method ID for HCP Boundary. 
  password_auth_method_login_name = "admin" # Admin user
  password_auth_method_password   = "PASSWORD" # Password for Admin user
  administratorUS_password        = 1234 # Password for "administrator-us" user in Boundary, used for administrating US region
  administratorEU_password        = 1234 # Password for "administrator-eu" user in Boundary, used for administrating EU region
  administratorAP_password        = 1234 # Password for "administrator-ap" user in Boundary, used for administrating AP region
  ```

### Contributing :

  - PRs are welcome !
  - Issue reports are welcome!
### License :
  - [MIT](https://choosealicense.com/licenses/mit/)