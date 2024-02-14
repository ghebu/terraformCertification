Checking the TF state

```
terraform state list
terraform state show 'module.networking.aws_subnet.milestone["1"]'
terraform state pull

```

Modifying the TF state
```
terraform state rm 'module.networking.aws_subnet.milestone["1"]'
terraform import 'module.networking.aws_subnet.milestone["1"]' subnet-00445e90db6d06470
```
