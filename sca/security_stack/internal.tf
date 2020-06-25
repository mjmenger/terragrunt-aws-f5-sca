locals {
  internal_bigip_map_az1 = {
    "0" = {
      "network_interfaces" = {
        "us-west-1a:management:0" = {
          "device_index"      = "0"
          "interface_type"    = "management"
          "cloudfailover_tag" = format( "%s-internal-%s", var.project, var.random_id )
          "private_ips_count" = 0
          "public_ip"         = true
          "subnet_id"         = var.subnets.az1.security.mgmt
          "subnet_security_group_ids" = [
            var.security_groups.management
          ]
        }
        "us-west-1a:public:0" = {
          "device_index"      = "1"
          "interface_type"    = "private"
          "cloudfailover_tag" = ""
          "private_ips_count" = 0
          "public_ip"         = false
          "subnet_id"         = var.subnets.az1.security.dmz_inside
          "subnet_security_group_ids" = [
            var.security_groups.public
          ]
        }
        "us-west-1a:private:0" = {
          "device_index"      = "2"
          "interface_type"    = "private"
          "cloudfailover_tag" = ""
          "private_ips_count" = 0
          "public_ip"         = false
          "subnet_id"         = var.subnets.az1.security.application_region
          "subnet_security_group_ids" = [
            var.security_groups.private
          ]
        }
        "us-west-1a:private:1" = {
          "device_index"      = "3"
          "interface_type"    = "private"
          "cloudfailover_tag" = ""
          "private_ips_count" = 0
          "public_ip"         = false
          "subnet_id"         = var.subnets.az1.security.internal
          "subnet_security_group_ids" = [
            var.security_groups.private
          ]
        }
      }
    }
  }
}
locals {
    internal_bigip_map_az2 = {
    "0" = {
      "network_interfaces" = {
        "us-west-1b:management:0" = {
          "device_index"      = "0"
          "interface_type"    = "management"
          "cloudfailover_tag" = format( "%s-internal-%s", var.project, var.random_id )
          "private_ips_count" = 0
          "public_ip"         = true
          "subnet_id"         = var.subnets.az2.security.mgmt
          "subnet_security_group_ids" = [
            var.security_groups.management
          ]
        }
        "us-west-1b:public:0" = {
          "device_index"      = "1"
          "interface_type"    = "private"
          "cloudfailover_tag" = ""
          "private_ips_count" = 0
          "public_ip"         = false
          "subnet_id"         = var.subnets.az2.security.dmz_inside
          "subnet_security_group_ids" = [
            var.security_groups.public
          ]
        }
        "us-west-1b:private:0" = {
          "device_index"      = "2"
          "interface_type"    = "private"
          "cloudfailover_tag" = ""
          "private_ips_count" = 0
          "public_ip"         = false
          "subnet_id"         = var.subnets.az2.security.application_region
          "subnet_security_group_ids" = [
            var.security_groups.private
          ]
        }
        "us-west-1b:private:1" = {
          "device_index"      = "3"
          "interface_type"    = "private"
          "cloudfailover_tag" = ""
          "private_ips_count" = 0
          "public_ip"         = false
          "subnet_id"         = var.subnets.az2.security.internal
          "subnet_security_group_ids" = [
            var.security_groups.private
          ]
        }
      }
    }
  }
}
# Setup Onboarding scripts
data "template_file" "internal_onboard_az1" {
  template = "${file("${path.root}/templates/bigip_onboard.tmpl")}"

  vars = {
    #uname        	      = var.adminAccountName
    # atc versions
    #example version:
    #as3Version            = "3.16.0"
    doVersion   = var.atc_versions.doVersion
    as3Version  = var.atc_versions.as3Version
    tsVersion   = var.atc_versions.tsVersion
    cfVersion   = var.atc_versions.cfVersion
    fastVersion = var.atc_versions.fastVersion
    onboard_log = "/var/log/startup-script.log"
    secret_id   = var.secrets_manager_name
    # gateways
    applicationGateway =  var.aws_cidr_ips.az1.security.application_region
    #dmzInsideGateway   =  var.aws_cidr_ips.az1.security.dmz_inside
    dmzOutsideGateway  =  var.aws_cidr_ips.az1.security.internal
    #egressCh1Gateway   =  var.aws_cidr_ips.az1.security.egress_to_ch1
    #egressCh2Gateway   =  var.aws_cidr_ips.az1.security.egress_to_ch2
    #internalGateway    =  var.aws_cidr_ips.az1.security.internal
    externalGateway    =  var.aws_cidr_ips.az1.security.application_region
    #mgmtGateway        =  var.aws_cidr_ips.az1.security.mgmt
    #peeringGateway     =  var.aws_cidr_ips.az1.security.peering
    # networks
    applicationNetwork =  var.subnet_cidrs.az1.security.application_region
    #dmzInsideNetwork   =  var.subnet_cidrs.az1.security.dmz_inside
    dmzOutsideNetwork  =  var.subnet_cidrs.az1.security.internal
    #egressCh1Network   =  var.subnet_cidrs.az1.security.egress_to_ch1
    #egressCh2Network   =  var.subnet_cidrs.az1.security.egress_to_ch2
    #internalNetwork    =  var.subnet_cidrs.az1.security.internal
    externalNetwork    =  var.subnet_cidrs.az1.security.dmz_inside
    #mgmtNetwork        =  var.subnet_cidrs.az1.security.mgmt
    #peeringNetwork     =  var.subnet_cidrs.az1.security.peering
    # sync must be other az
    syncNetwork        = var.subnet_cidrs.az2.security.application_region
  }
}
data "template_file" "internal_onboard_az2" {
  template = "${file("${path.root}/templates/bigip_onboard.tmpl")}"

  vars = {
    #uname        	      = var.adminAccountName
    # atc versions
    #example version:
    #as3Version            = "3.16.0"
    doVersion   = var.atc_versions.doVersion
    as3Version  = var.atc_versions.as3Version
    tsVersion   = var.atc_versions.tsVersion
    cfVersion   = var.atc_versions.cfVersion
    fastVersion = var.atc_versions.fastVersion
    onboard_log = "/var/log/startup-script.log"
    secret_id   = var.secrets_manager_name
    # gateways
    applicationGateway =  var.aws_cidr_ips.az2.security.application_region
    #dmzInsideGateway   =  var.aws_cidr_ips.az2.security.dmz_inside
    dmzOutsideGateway  =  var.aws_cidr_ips.az2.security.internal
    #egressCh1Gateway   =  var.aws_cidr_ips.az2.security.egress_to_ch1
    #egressCh2Gateway   =  var.aws_cidr_ips.az2.security.egress_to_ch2
    #internalGateway    =  var.aws_cidr_ips.az2.security.internal
    externalGateway    =  var.aws_cidr_ips.az2.security.application_region
    #mgmtGateway        =  var.aws_cidr_ips.az2.security.mgmt
    #peeringGateway     =  var.aws_cidr_ips.az2.security.peering
    # networks
    applicationNetwork =  var.subnet_cidrs.az2.security.application_region
    #dmzInsideNetwork   =  var.subnet_cidrs.az2.security.dmz_inside
    dmzOutsideNetwork  =  var.subnet_cidrs.az2.security.internal
    #egressCh1Network   =  var.subnet_cidrs.az2.security.egress_to_ch1
    #egressCh2Network   =  var.subnet_cidrs.az2.security.egress_to_ch2
    #internalNetwork    =  var.subnet_cidrs.az2.security.internal
    externalNetwork    =  var.subnet_cidrs.az2.security.dmz_inside
    #mgmtNetwork        =  var.subnet_cidrs.az2.security.mgmt
    #peeringNetwork     =  var.subnet_cidrs.az2.security.peering
    # sync must be other az
    syncNetwork        = var.subnet_cidrs.az1.security.application_region
  }
}
#
# Create BIG-IP
#
module internal_az1 {
  source = "github.com/f5devcentral/terraform-aws-bigip?ref=cfe-compatibility"

  prefix = format(
    "%s-bigip_with_new_vpc_internal-%s",
    var.project,
    var.random_id
  )
  ec2_instance_type           = var.ec2_instance_type
  ec2_key_name                = var.ec2_key_name
  aws_secretmanager_secret_id = var.secrets_manager_name
  bigip_map                   = local.internal_bigip_map_az1
  iam_instance_profile        = var.iam_instance_profile_name
  custom_user_data            = data.template_file.internal_onboard_az1.rendered
}

module internal_az2 {
  source = "github.com/f5devcentral/terraform-aws-bigip?ref=cfe-compatibility"

  prefix = format(
    "%s-bigip_with_new_vpc_internal-%s",
    var.project,
    var.random_id
  )
  ec2_instance_type           = var.ec2_instance_type
  ec2_key_name                = var.ec2_key_name
  aws_secretmanager_secret_id = var.secrets_manager_name
  bigip_map                   = local.internal_bigip_map_az2
  iam_instance_profile        = var.iam_instance_profile_name
  custom_user_data            = data.template_file.internal_onboard_az2.rendered
}
