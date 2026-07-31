
resource "oci_identity_group" "example_group" {
  name           = "tf-example-group"
  description    = "group created by terraform"
  compartment_id = var.tenancy_ocid
}

resource "oci_identity_policy" "example_policy" {
  name           = "tf-example-policy"
  description    = "policy created by terraform"
  compartment_id = var.tenancy_ocid
  statements = [
    "Allow group ${oci_identity_group.example_group.name} to read instances in compartment ${var.compute}",
    "Allow group ${oci_identity_group.example_group.name} to inspect instances in compartment ${var.applications}",
  ]
}
