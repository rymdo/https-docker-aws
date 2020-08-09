include {
  path = find_in_parent_folders()
}

terraform {
  source = "${run_cmd("bash", "-c", "echo $(git rev-parse --show-toplevel)/infrastructure/aws-modules/modules//services/backend/security | tr -d '\n'")}"
}

inputs = {
  environment         = "${run_cmd("bash", "-c", "jq -r '.name' ${get_parent_terragrunt_dir()}/environment.json | tr -d '\n'")}"
  developer_ssh_cidrs = "${run_cmd("bash", "-c", "jq -r '.service.backend.security.developer.ssh_cidrs' ${get_parent_terragrunt_dir()}/environment.json | tr -d '\n'")}"
}
