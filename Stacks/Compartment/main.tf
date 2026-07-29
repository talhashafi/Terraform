resource "oci_identity_compartment" "compartment01" {
  name           = "testcompartment"
  description    = "compartment created by terraform as a test for learning"
  compartment_id = var.tenancy_ocid
  enable_delete  = false // true will cause this compartment to be deleted when running `terrafrom destroy`
}