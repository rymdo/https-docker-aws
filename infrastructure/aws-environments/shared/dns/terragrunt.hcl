include {
  path = find_in_parent_folders()
}

terraform {
  source = "${run_cmd("bash", "-c", "echo $(git rev-parse --show-toplevel)/infrastructure/aws-modules/modules//dns | tr -d '\n'")}"
}

inputs = {
  domain_primary = "${run_cmd("bash", "-c", "jq -r '.domain.primary' ${get_parent_terragrunt_dir()}/environment.json | tr -d '\n'")}"
}
