resource "google_project_service" "run" {
  service = "run.googleapis.com"
}


module "backend" {
  source     = "github.com/tinyKnightOfCoding/bonsai//modules/service"
  name       = "bonsai-backend"
  location   = var.location
  image      = "${var.docker-repo}/bonsai-backend:${var.app-version}"
  port       = "8080"
  depends_on = [google_project_service.run]
}
