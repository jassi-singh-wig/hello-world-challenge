# https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.22.0"
    }
  }
}


provider "docker" {
  host = "unix:///var/run/docker.sock"
}


resource "docker_network" "private_network" {
  name = "hello-world-challenge_elastic"
  driver = "bridge"
  attachable = true
}

resource "docker_container" "hello_world_app" {
  image = "jassi/hello-world:1.0.0"
  name  = "hello-world"
  restart = "always"
  start = true
  env = var.env-var
  volumes {
    container_path  = "/wip"
    # replace the host_path with full path for your project directory starting from root directory /
    host_path = "/Users/Jaskaran.Singh/Downloads/github/hello-world-challenge/hello-world/src" 
    read_only = false
  }
  ports {
    internal = 5000
    external = 5002
  }

  networks_advanced {
    name = docker_network.private_network.name
  }
}
