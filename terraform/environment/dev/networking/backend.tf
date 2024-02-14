terraform {
  backend "s3" {
    bucket         = "noaptea-companiilor-bucket-yczqn6hl"
    key            = "networking/tfstate"
    region         = "us-east-1"
    dynamodb_table = "noaptea-companiilor-lock"
  }
}