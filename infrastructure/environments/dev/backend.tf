terraform {
  backend "gcs" {
    bucket = "murgiwnqzl-terraform-state"
    prefix = "dev"
  }
}