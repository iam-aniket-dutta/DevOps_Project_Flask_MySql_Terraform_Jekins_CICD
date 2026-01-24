terraform {
  backend "s3" {
    region       = "us-east-1"
    bucket       = "flask-mysql-app"
    key          = "flaskapp/tfstate"
    use_lockfile = true
  }
}
