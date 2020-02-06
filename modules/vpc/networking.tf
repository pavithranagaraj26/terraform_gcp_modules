resource "google_compute_network" "ia-vpc-global" {
 name                    = "${var.name}"
 auto_create_subnetworks = "false"
 routing_mode            = "${var.routing_mode}"
}

resource "google_compute_subnetwork" "ia-vpc-dev-internal-global" {
 name          = "${var.internal-subnet_name}"
 ip_cidr_range = "${var.internal_subnet_cidr}"
 network       = "${var.name}"
 depends_on    = ["google_compute_network.var.name"]
 region      = "${var.region}"
}

resource "google_compute_subnetwork" "ia-vpc-dev-external-global" {
 name          = "${var.external-subnet_name}"
 ip_cidr_range = "${var.external_subnet_cidr}"
 network       = "${var.name}"
 depends_on    = ["google_compute_network.var.name"]
 region      = "${var.region}"
}

output "vpc_id" {
  value = "${var.google_compute_network.ia-vpc-global.name}"
  }

output "subnet_id" {
  value = "${var.google_compute_subnetwork.ia-vpc-dev-external-global.ip_cidr_range}"
}
