terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Docker network
resource "docker_network" "subnet_prod" {
  name = var.network_name
}

# PostgreSQL container
resource "docker_container" "postgres" {
  name  = var.postgres_container_name
  image = var.postgres_image

  env = [
    "POSTGRES_DB=${var.postgres_db}",
    "POSTGRES_USER=${var.postgres_user}",
    "POSTGRES_PASSWORD=${var.postgres_password}"
  ]

  ports {
    internal = 5432
    external = 5432
  }

  networks_advanced {
    name = docker_network.subnet_prod.name
  }
}

# Client container that connects to PostgreSQL
resource "docker_container" "postgres_client" {
  name  = var.client_container_name
  image = var.client_image

  depends_on = [docker_container.postgres]

  command = [
    "sh", "-c",
    <<EOF
    apk add --no-cache postgresql-client &&
    until pg_isready -h ${docker_container.postgres.name} -p 5432; do sleep 2; done &&
    echo " ----------------- Successfully connected to PostgreSQL ----------------"
    EOF
  ]

  networks_advanced {
    name = docker_network.subnet_prod.name
  }
}

