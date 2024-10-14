## Install Terraform 

```
yum install jq git unzip wget -y 
```

## Download Terraform
```
wget https://releases.hashicorp.com/terraform/1.9.7/terraform_1.9.7_linux_amd64.zip

unzip terraform_1.9.7_linux_amd64.zip

mv terraform /usr/local/bin/
```

```
terraform --version
```


# Enable SSH Auth. 

## Edit SSH Config & Enable Root Login:
```
[root@terrafrom-vm ~]# cat /etc/ssh/sshd_config | grep -E 'PermitRootLogin|PasswordAuthentication'
PermitRootLogin yes
PasswordAuthentication yes
# PasswordAuthentication.  Depending on your PAM configuration,
# the setting of "PermitRootLogin without-password".
# PAM authentication, then enable this but set PasswordAuthentication
[root@terrafrom-vm ~]# 
```

## Restart SSHD Service
```
[root@terrafrom-vm ~]#service sshd restart
```

## Set Super / Root User Password
```
[root@terrafrom-vm ~]#password
```



# It's Time to Configure VsCode with Terraform instance via SSH. 

#### Step1:  Download & Setup VsCode 

#### Step2:  Go VsCode Extensions & Download SSH-Remote, HashiCorp Terraform Extensions. 

#### Step3:  Post Remote-SSH Installation -> Click on Remote Expolor Icon -> SSH -> +  ssh root@yoursshinstancepublicIP.

#### Step4:  Re-Open the VsCode -> Click on Remote Expolor Icon -> SSH -> Click on Arror Icon in Front of your SSH Instance (->)

#### Step5:  Open Terminal -> Clone the Repo. ( https://github.com/amitvashisttech/terraform-gcp-azure-devops-ericsson-14-Oct-2024.git )

#### Step6:  Open Folder -> Select Open Folder -> terraform-gcp-azure-devops-ericsson-14-Oct-2024 -> Trust the Author. 
