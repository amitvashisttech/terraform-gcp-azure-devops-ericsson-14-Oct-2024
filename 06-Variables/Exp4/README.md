terraform plan -var="instance_count=1" -var="instance_name=uat-vm" 



terraform apply -var="instance_count=1" -var="instance_name=uat-vm" 



terraform plan -var-file=uat.tfvars 
terraform plan -var-file=prod.tfvars
