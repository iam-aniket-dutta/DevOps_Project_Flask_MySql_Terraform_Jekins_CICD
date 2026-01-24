terraform {
  backend "s3" {
    region       = var.region
    bucket       = var.bucket_name
    key          = "flaskapp/tfstate"
    use_lockfile = true
  }
}
