terraform {
  backend "gcs" {
    bucket = "tkoc-bonsai-example-dev-tfstate"
  }
}