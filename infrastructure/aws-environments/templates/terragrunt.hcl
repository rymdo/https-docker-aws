remote_state {
  backend = "s3"
  config = {
    region         = "${run_cmd("bash", "-c", "jq -r '.region' ${get_parent_terragrunt_dir()}/environment.json | tr -d '\n'")}"
    bucket         = "tf-${run_cmd("bash", "-c", "jq -r '.name' ${get_parent_terragrunt_dir()}/environment.json | tr -d '\n'")}-state-${get_aws_account_id()}"
    dynamodb_table = "tf-${run_cmd("bash", "-c", "jq -r '.name' ${get_parent_terragrunt_dir()}/environment.json | tr -d '\n'")}-lock-table-${get_aws_account_id()}"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    encrypt        = true
  }
}

generate "backend" {
  path      = "backend.generated.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "s3" {}
}
EOF
}

generate "provider" {
  path      = "provider.generated.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region  = "${run_cmd("bash", "-c", "jq -r '.region' ${get_parent_terragrunt_dir()}/environment.json | tr -d '\n'")}"
}
EOF
}
