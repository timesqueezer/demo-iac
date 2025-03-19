terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

variable "name" {
  description = "Name of the Nginx container"
  type        = string
}

variable "external_port" {
  description = "External port for the Nginx container"
  type        = number
}

resource "docker_image" "nginx" {
  name         = "local/nginx-python"
  keep_locally = true

}

resource "docker_container" "nginx_server" {
  name = var.name
  image = docker_image.nginx.image_id

  destroy_grace_seconds = 1

  ports {
    internal = 80
    external = var.external_port
  }

  lifecycle {
    ignore_changes = [
      network_mode,
    ]
  }

}
