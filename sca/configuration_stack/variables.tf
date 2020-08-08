variable bigip_mgmt_ips {
    type = map(list(string))
}
variable project {
    type = string
}
variable random_id {
    type = string
}

variable "aws_region" {
    type = string
}

# DO variables for each BIG-IP tier
## Ext tier
variable "bigip_map" {
    type = map(map(map(object({
            attachment = list(any)
            description = string
            id = string
            mac_address = string
            outpost_arn = string
            private_dns_name = string
            private_ip = string
            private_ips = list(string)
            private_ips_count = number
            security_groups = list(string)
            source_dest_check = bool
            subnet_id = string
            tags = map(string)
        }
        )
    )))
}
variable "ext0_gateway" {
    default = "10.100.0.1"
}
variable "ext1_gateway" {
    default = "10.100.10.1"
}
variable "ips0_gateway" {
    default = "10.100.6.1"
}
variable "ips1_gateway" {
    default = "10.100.16.1"
}
variable "int0_gateway" {
    default = "10.0.7.1"
}
variable "int1_gateway" {
    default = "10.0.17.1"
}



# DO variables common across all tiers
variable ntp_server {
    default = "0.us.pool.ntp.org"
}
variable dns_server {
    default = "8.8.8.8"
}
variable timezone {
    default = "UTC"
}
variable uname {
    default = "admin"
}
variable secrets_manager_name {
    type = string
}

variable cfe_bucket_external {
    type = object( {
        acceleration_status                  = string
        acl                                  = string
        arn                                  = string
        bucket                               = string
        bucket_domain_name                   = string
        bucket_prefix                        = string
        bucket_regional_domain_name          = string
        cors_rule                            = list(any)
        force_destroy                        = bool
        grant                                = list(any)
        hosted_zone_id                       = string
        id                                   = string
        lifecycle_rule                       = list(any)
        logging                              = list(any)
        object_lock_configuration            = list(any)
        region                               = string
        replication_configuration            = list(any)
        request_payer                        = string
        server_side_encryption_configuration = list(any)
        tags                                 = map(string)
        versioning                           = list(any)
        website                              = list(any)
        }        
    )
}
variable cfe_bucket_internal {
    type = object( {
        acceleration_status                  = string
        acl                                  = string
        arn                                  = string
        bucket                               = string
        bucket_domain_name                   = string
        bucket_prefix                        = string
        bucket_regional_domain_name          = string
        cors_rule                            = list(any)
        force_destroy                        = bool
        grant                                = list(any)
        hosted_zone_id                       = string
        id                                   = string
        lifecycle_rule                       = list(any)
        logging                              = list(any)
        object_lock_configuration            = list(any)
        region                               = string
        replication_configuration            = list(any)
        request_payer                        = string
        server_side_encryption_configuration = list(any)
        tags                                 = map(string)
        versioning                           = list(any)
        website                              = list(any)
    })
}
variable CFE_route_tables {
    type = map(string)
}
