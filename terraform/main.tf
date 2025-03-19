variable "nginx_name" {
  description = "Name of the Nginx container"
  type        = string
}

variable "nginx_external_port" {
  description = "External port for the Nginx container"
  type        = number
}

module "docker-nginx" {
  source = "./modules/docker-nginx"

  name = var.nginx_name
  external_port = var.nginx_external_port
}
