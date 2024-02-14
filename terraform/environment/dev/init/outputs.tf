output "bucket_name" { 
    value = module.remoteState.bucket_name
}

output "dynamodb_table_name" { 
    value = module.remoteState.dynamodb_table_name
}