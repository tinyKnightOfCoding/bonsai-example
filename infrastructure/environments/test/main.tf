provider "google" {
  project = var.project
  region  = var.location
}

module "app" {
  source = "../../modules/app"
  app-version = var.app-version
  location = var.location
  docker-repo = var.docker-repo
}