variable "environment" {
  default = "dev"
}

variable "web_port" {
  type    = number
  default = 80
}

variable "db_port" {
  type    = number
  default = 1433
}

######servers
variable "server_names" {
  type = list(string)
  default = [
    "web01",
    "web02",
    "web03"
  ]
}

variable "compartment_name" {
  default = "shared-services"
}

variable "availability_domain" {
  default = "AD-1"
}

variable "instance_shape" {
  default = "VM.Standard.E4.Flex"
}

######networks
variable "vcn_name" {
  default = "nonprod-vcn"
}

variable "cidr" {
  default = "10.0.0.0/16"
}

variable "subset_names" {
  type = list(string)
  default = [
    "web-subnet",
    "db-subnet"
  ]
}

variable "subset_cidr" {
  type = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}

variable "nsg_name" {
  default = "web-nsg"
}