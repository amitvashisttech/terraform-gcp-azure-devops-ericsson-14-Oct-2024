module "instance" {
  source = "./gcp_instance"
}


module "frontend" {
  source           = "./gcp_instance"
  environment-name = "frontend"
}

module "backend" {
  source           = "./gcp_instance"
  environment-name = "backend"
  instance_count   = 2
}