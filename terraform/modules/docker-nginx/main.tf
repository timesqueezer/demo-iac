terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

resource "docker_image" "nginx" {
  name         = "local/nginx-python"
  keep_locally = true

}

resource "docker_container" "nginx_server" {
  name  = "demo_nginx"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 8080
  }

  lifecycle {
    ignore_changes = [
      network_mode,
    ]
  }

}
