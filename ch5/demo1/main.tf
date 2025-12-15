terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}


provider "docker" {}

resource "docker_container" "web-test" {
  name  = "web-test"
  image = "crccheck/hello-world"

  ports {
    internal = 8000
    external = 80
  }
}

