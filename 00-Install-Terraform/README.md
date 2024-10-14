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


## Enable SSH Auth. 
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
