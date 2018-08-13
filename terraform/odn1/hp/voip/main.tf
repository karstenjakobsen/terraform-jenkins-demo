# ------------------------------------------------------------------------------
# VMWARE VSPHERE - Provider variables
# ------------------------------------------------------------------------------

## Setup needed variables
variable "vsphere_user" {
  default = "terraform-odn@vsphere.local"
}

variable "vsphere_password" {
  # export TF_VAR_vsphere_password=mysupersecretpassword
}

variable "vsphere_server" {
  default = "10.50.21.10"
}

# ------------------------------------------------------------------------------
# DATACENTER
# ------------------------------------------------------------------------------

data "vsphere_datacenter" "datacenter" {
  name = "${var.datacenter}"
}

variable "datacenter" {
  default = "odn1"
}

