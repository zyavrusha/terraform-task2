terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = "zyavrusha/jenkins_task3:60" # define the build which is used to run container
}

resource "docker_container" "simple_app" {
  count = 3 # Create 3 containers 

  image = docker_image.nginx.latest
  name  = "nginx-container-${count.index}"
  ports {
	internal = 80
	external = 80 + count.index # each container will have own external port
  }
}