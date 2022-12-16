terraform {
  backend "gcs" {
    bucket = "tkoc-bonsai-terraform-state"
    prefix = "test/state"
  }
}