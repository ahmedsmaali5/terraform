terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# ------------------------------------- servers as a map (perfect for for_each)
variable "servers" {
  default = {
    server1 = {
      name   = "nginx-server1"
      port   = 8081
      folder = "server1"
    }
    server2 = {
      name   = "nginx-server2"
      port   = 8082
      folder = "server2"
    }
    server3 = {
      name   = "nginx-server3"
      port   = 8083
      folder = "server3"
    }
  }
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  for_each = var.servers

  name  = each.value.name
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = each.value.port
  }

  volumes {
    host_path      = "/home/ahmed/terraform-course/ch2/demo2/html/${each.value.folder}"
    container_path = "/usr/share/nginx/html"
  }
}

