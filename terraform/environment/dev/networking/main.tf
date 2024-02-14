module "networking" { 
    source = "../../../modules/milestone1/"
}


# # #terraform state rm 'module.networking.aws_instance.bastion'
# import {
#     to = module.networking.aws_instance.bastion
#     id = "i-0144627df18666722"
# }