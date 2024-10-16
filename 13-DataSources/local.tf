locals {
  default_frontend_name = join("-", tolist([var.environment-name, "proxy"]))
  default_backend_name  = join("-", tolist([var.environment-name, "database"]))
  west_frontend_name = join("-", tolist([var.environment-name, "proxy-west"]))
  west_backend_name  = join("-", tolist([var.environment-name, "database-west"]))
}



