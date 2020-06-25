# stage/mysql/terragrunt.hcl
include {
  path = find_in_parent_folders()
}

dependency "core" {
  config_path = "../core"
}

inputs = {
  aws_cidr_ips              = dependency.core.outputs.aws_cidr_ips
  iam_instance_profile_name = dependency.core.outputs.iam_instance_profile_name
  random_id                 = dependency.core.outputs.random_id
  route_tables              = dependency.core.outputs.route_tables
  secrets_manager_name      = dependency.core.outputs.secrets_manager_name
  security_groups           = dependency.core.outputs.security_groups
  subnet_cidrs              = dependency.core.outputs.subnet_cidrs
  subnets                   = dependency.core.outputs.subnets
  transit_gateways          = dependency.core.outputs.transit_gateways
  vpcs                      = dependency.core.outputs.vpcs
}