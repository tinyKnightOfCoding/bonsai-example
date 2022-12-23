data "google_project" "project-main" {
  project_id = "${var.project-prefix}-main"
}

data "google_artifact_registry_repository" "repo" {
  location      = var.location
  repository_id = "${var.project-prefix}-repo"
  project       = data.google_project.project-main.id
}

locals {
  repo-name = "${var.location}-docker.pkg.dev/${data.google_project.project-main.id}/${var.project-prefix}-repo"
}

resource "google_project_service" "run" {
  service = "run.googleapis.com"
}

resource "google_project_iam_member" "artifact-reader" {
  member  = "serviceAccount:service-${data.google_project.project-main.number}@serverless-robot-prod.iam.gserviceaccount.com"
  project = "${var.project-prefix}-main"
  role    = "roles/artifactregistry.reader"
  depends_on = [google_project_service.run]
}


module "backend" {
  source     = "github.com/tinyKnightOfCoding/bonsai//modules/service"
  name       = "bonsai-backend"
  location   = var.location
  image      = "${local.repo-name}/bonsai-backend:${var.app-version}"
  port       = "8080"
  depends_on = [google_project_service.run, google_project_iam_member.artifact-reader]
}

module "frontend" {
  source     = "github.com/tinyKnightOfCoding/bonsai//modules/service"
  name       = "bonsai-frontend"
  location   = var.location
  image      = "${local.repo-name}/bonsai-frontend:${var.app-version}"
  port       = "80"
  depends_on = [google_project_service.run, google_project_iam_member.artifact-reader]
}
