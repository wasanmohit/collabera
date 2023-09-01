terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pulls the image
resource "docker_image" "nginx" {
  name = "nginxdemos/hello:plain-text"
}

# Create a container
resource "docker_container" "foo" {
  image = docker_image.nginx.image_id
  name  = "foo"
  ports {
    internal = 80
    external = 8000
  }
}
