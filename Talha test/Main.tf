terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

resource "local_file" "web_config" {
  filename = "app/web.conf"
  content  = <<EOT
environment=${var.environment}
server=${var.server_names[0]}
port=${var.web_port}
EOT
}

resource "local_file" "db_config" {
  filename = "app/db.conf"
  content  = <<EOT
environment=${var.environment}
server=${var.server_names[0]}
port=${var.db_port}
EOT
}

resource "local_file" "app_config" {
  filename = "app/app.conf"
  content  = <<EOT
environment=${var.environment}
app=inventory
version=1.0
EOT
}

resource "local_file" "oci_web_servers" {
  for_each = toset(var.server_names)

  filename = "app/${each.value}.conf"
  content  = <<EOT
        servername = ${each.value}
        compartment_name = ${var.compartment_name}
        availability_domain = ${var.availability_domain}
        instance_shape = ${var.instance_shape}
     EOT
}

resource "local_file" "networks" {
  filename = "app/networks.conf"
  content  = <<EOT
        vcn_name= ${var.vcn_name}
        cidr=${var.cidr}
        subset_names= ${join(",",var.subset_names)}
        subset_cidr=${join(",",var.subset_cidr)}
        nsg_name=${var.nsg_name}
    EOT
}



