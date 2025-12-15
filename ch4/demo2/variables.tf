variable "network_name" {
  description = "Docker network name"
  type        = string
  default     = "subnet_prod"
}

variable "postgres_image" {
  description = "PostgreSQL Docker image"
  type        = string
  default     = "postgres:15"
}

variable "postgres_container_name" {
  description = "PostgreSQL container name"
  type        = string
  default     = "postgres_db"
}

variable "postgres_db" {
  description = "PostgreSQL database name"
  type        = string
  default     = "appdb"
}

variable "postgres_user" {
  description = "PostgreSQL username"
  type        = string
  default     = "appuser"
}

variable "postgres_password" {
  description = "PostgreSQL password"
  type        = string
  default     = "apppassword"
}

variable "client_image" {
  description = "Client container image"
  type        = string
  default     = "alpine:latest"
}

variable "client_container_name" {
  description = "Client container name"
  type        = string
  default     = "postgres_client"
}

