terraform {
  backend "gcs" {
    bucket = "tkoc-bonsai-terraform-state"
    prefix = "dev/state"
  }
}