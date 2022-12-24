provider "google" {
  project = "${var.project-prefix}-dev"
  region  = var.location
}

module "app" {
  source         = "../../modules/app"
  app-version    = var.app-version
  stage          = "dev"
  location       = var.location
  project-prefix = var.project-prefix
  host           = var.host
}