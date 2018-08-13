# ------------------------------------------------------------------------------
# VMWARE VSPHERE
# ------------------------------------------------------------------------------

provider "vsphere" {

    user           = "${var.vsphere_user}"
    password       = "${var.vsphere_password}"
    vsphere_server = "${var.vsphere_server}"

    # if you have a self-signed cert
    allow_unverified_ssl = true

    version = "1.6.0"

}

provider "null" {

  version = "1.0.0"

}

provider "template" {

 version = "1.0.0"

}

provider "ignition" {
  version = "1.0.1" 
}
