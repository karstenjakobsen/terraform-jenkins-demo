terraform {

  backend "consul" {
    address = "127.0.0.1:8500"
    path    = "terraform/odn1/hp/voip"
  }

}

