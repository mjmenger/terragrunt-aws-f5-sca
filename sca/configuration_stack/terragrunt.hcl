# stage/mysql/terragrunt.hcl
include {
  path = find_in_parent_folders()
}

dependency "core" {
  config_path = "../core"
}

dependency "security" {
  config_path = "../security_stack"
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
  CFE_route_tables          = dependency.core.outputs.CFE_route_tables
  cfe_bucket_external       = dependency.security.outputs.cfe_bucket_external
  cfe_bucket_internal       = dependency.security.outputs.cfe_bucket_internal
  bigip_mgmt_ips            = dependency.security.outputs.bigip_mgmt_ips
  bigip_map                 = dependency.security.outputs.bigip_map
}