# General
project        = "backstage"
default_region = "us-east-1"
vpc_cidr_block = "172.31.0.0/16"
public_subnets = {
  "us-east-1a" = "172.31.0.0/20",
  "us-east-1b" = "172.31.16.0/20"
}