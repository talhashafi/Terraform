locals {
  compartments = ["compartment01", "compartment02", "compartment03", "compartment04"]
}

resource "oci_identity_compartment" "compartment00" {
  name           = "testcompartment"
  description    = "compartment created by terraform as a test for learning"
  compartment_id = var.tenancy_ocid
  enable_delete  = false // true will cause this compartment to be deleted when running `terrafrom destroy`
}

resource "oci_identity_compartment" "compartments_group" {

  for_each = toset(local.compartments)

  name           = each.value
  compartment_id = oci_identity_compartment.compartment00.id
  description = "creating compartment- ${each.value}"
}
