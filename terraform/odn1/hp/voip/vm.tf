module "voip_test" {
  
  source = "git@github.com:pasientskyhosting/terraform-modules.git//modules/vsphere_vm?ref=v5.0.0-rc3"

  datacenter = "${data.vsphere_datacenter.datacenter.name}"

  # Ensure that each property contains the same number of items
  hostname            = "odn1-test021"
  ipv4_address        = "10.50.61.100"

  # Properties below can be single or multiple comma seperated.
  ipv4_gateway        = "10.50.61.1"
  ipv4_netmask        = "24"
  vlan_name           = "voip/vlan-601"
  num_cpus            = 2
  memory              = "2048"
  datastore           = "S1_ODN1_SSD_04,S2_ODN1_SSD_04,S1_ODN1_SSD_02"
  folder              = "customers/voip"
  pool_name           = "odn1-customers/Resources"

  # Properties below can only occur once
  template_vm             = "templates/ubuntu_16.04" # Template is used to determine version and distro type

}

