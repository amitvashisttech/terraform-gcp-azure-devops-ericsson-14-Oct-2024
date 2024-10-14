## Terraform Syntax Validation 
```
terraform validate
```

## Terraform Linting 
```
terraform fmt
```

## Terraform Build Plan Genration 
```
terraform plan -out build-plan
```

## Apply Build Plan 
```
terraform apply build-plan
```


## Terraform Destroy Plan Genration
```
terraform plan -destroy -out destroy-plan
```

## Apply Destroy Plan 
```
terraform apply destroy-plan
```

## Apply with Auto Approval 
```
terraform apply --auto-approve 
```

## List the state of Resource
```
terraform state list 
```

## Destroy a target resource
```
terraform destroy -target "google_compute_instance.vm3"
```