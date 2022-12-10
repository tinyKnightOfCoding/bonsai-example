terraform {
  backend "gcs" {
    bucket = "tkoc-bonsai-example-prod-tfstate"
  }
}