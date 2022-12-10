terraform {
  backend "gcs" {
    prefix = "prod"
  }
}