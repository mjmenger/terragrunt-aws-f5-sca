provider "bigip" {
  version = "~> 1.2"
  alias = "external_bigip_az1"
  address = "https://${var.bigip_mgmt_ips.external_az1[0]}"
  username = "admin"
  password = data.aws_secretsmanager_secret_version.secret.secret_string
}

provider "bigip" {
  version = "~> 1.2"
  alias = "external_bigip_az2"
  address = "https://${var.bigip_mgmt_ips.external_az2[0]}"
  username = "admin"
  password = data.aws_secretsmanager_secret_version.secret.secret_string
}

provider "bigip" {
  version = "~> 1.2"
  alias = "ips_bigip_az1"
  address = "https://${var.bigip_mgmt_ips.ips_az1[0]}"
  username = "admin"
  password = data.aws_secretsmanager_secret_version.secret.secret_string
}

provider "bigip" {
  version = "~> 1.2"
  alias = "ips_bigip_az2"
  address = "https://${var.bigip_mgmt_ips.ips_az2[0]}"
  username = "admin"
  password = data.aws_secretsmanager_secret_version.secret.secret_string
}

provider "bigip" {
  version = "~> 1.2"
  alias = "internal_bigip_az1"
  address = "https://${var.bigip_mgmt_ips.internal_az1[0]}"
  username = "admin"
  password = data.aws_secretsmanager_secret_version.secret.secret_string
}

provider "bigip" {
  version = "~> 1.2"
  alias = "internal_bigip_az2"
  address = "https://${var.bigip_mgmt_ips.internal_az2[0]}"
  username = "admin"
  password = data.aws_secretsmanager_secret_version.secret.secret_string
}
