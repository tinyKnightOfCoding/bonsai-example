provider "google" {
  project = "${var.project-prefix}-dev"
  region  = var.location
  version = "4.47.0"
}

module "app" {
  source         = "../../modules/app"
  app-version    = var.app-version
  stage          = "dev"
  location       = var.location
  project-prefix = var.project-prefix
}