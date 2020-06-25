variable "ec2_key_name" {
  description = "AWS EC2 Key name for SSH access"
  type        = string
}

variable "ec2_instance_type" {
  description = "AWS EC2 instance type"
  type        = string
  default     = "m4.xlarge"
}

variable "atc_versions" {
  description = "F5 Automation Toolchain Version used in this project"
  type        = map(string)
  default = {
    doVersion   = "1.12.0"
    as3Version  = "3.20.0"
    tsVersion   = "1.11.0"
    cfVersion   = "1.3.0"
    fastVersion = "0.2.0"
  }
}

variable aws_region {
  type = string
}
variable project {
  type = string
}
variable random_id {
  type = string
}
variable secrets_manager_name {
  type = string
}
variable iam_instance_profile_name {
  type = string
}
variable security_groups {
  type = map(string)
}
variable vpcs {
  type = map(string)
}
variable subnets {
  type = map(map(map(string)))
}
variable route_tables {
  type = map(string)
}
variable transit_gateways {
  type = map(string)
}
variable aws_cidr_ips {
  type = map(map(map(string)))
}
variable subnet_cidrs {
  type = map(map(map(string)))
}
