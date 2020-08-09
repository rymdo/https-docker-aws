include {
  path = find_in_parent_folders()
}

terraform {
  source = "${run_cmd("bash", "-c", "echo $(git rev-parse --show-toplevel)/infrastructure/aws-modules/modules//vpc | tr -d '\n'")}"
}

inputs = {
  environment       = "${run_cmd("bash", "-c", "jq -r '.name' ${get_parent_terragrunt_dir()}/environment.json | tr -d '\n'")}"
  availability_zone = "${run_cmd("bash", "-c", "jq -r '.vpc.availability_zone' ${get_parent_terragrunt_dir()}/environment.json | tr -d '\n'")}"
}
