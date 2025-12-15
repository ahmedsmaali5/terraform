terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

module "nginx" {
  source         = "./nginx_module"
  container_name = "my_nginx"
}

output "container_name" {
  value = module.nginx.nginx_container_name
}

output "container_id" {
  value = module.nginx.nginx_container_id
}

