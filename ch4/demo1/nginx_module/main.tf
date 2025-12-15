terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}



resource "docker_container" "nginx" {
  name  = var.container_name
  image = "nginx:latest"

  ports {
    internal = 80
    external = 8080
  }
}

