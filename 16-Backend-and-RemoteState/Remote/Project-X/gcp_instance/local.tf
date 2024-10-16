locals {
  default_instance_name = join("-", tolist([var.environment-name, "vm"]))
}



