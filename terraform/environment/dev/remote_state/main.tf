data "terraform_remote_state" "remote" {
  backend = "s3"
  config = {
    bucket = var.bucket
    key = var.key
    region = "us-east-1"
  }
}

output "remote_state" { 
    value = data.terraform_remote_state.remote
}

output "remote_state_outputs" { 
    value = data.terraform_remote_state.remote.outputs
}

output "remote_state_subnet" { 
    value = data.terraform_remote_state.remote.outputs.everything.debug
}