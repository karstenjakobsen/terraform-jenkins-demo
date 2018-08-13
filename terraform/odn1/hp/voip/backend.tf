terraform {

  backend "consul" {
    address = "localhost:8500"
    path    = "terraform/odn1/hp/voip"
  }

}
