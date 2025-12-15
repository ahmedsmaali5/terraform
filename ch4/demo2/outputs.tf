output "postgres_container" {
  description = "PostgreSQL container details"
  value = {
    name = docker_container.postgres.name
    id   = docker_container.postgres.id
  }
}

output "client_container" {
  description = "PostgreSQL client container details"
  value = {
    name = docker_container.postgres_client.name
    id   = docker_container.postgres_client.id
  }
}

