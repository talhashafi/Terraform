variable "tenancy_ocid" {   
    type = string
}

variable "compute" {
    default = "testcompartment:compute"
}

variable "application" {
    default = "testcompartment:application"
}

variable "networks" {
    default = "testcompartment:networks"
}

variable "security" {
    default = "testcompartment:security"
}