# Usage
* Script
```
git config --global core.autocrlf false
git config --global core.eol lf
git clone https://github.com/Finfra/jenkins_quickstart
cd jenkins_quickstart/terraform/
ssh-keygen -f ~/mykey

terraform init
terraform plan
terraform apply -auto-approve

```

  * Output Example
```
Outputs:
Jenkins-ip = 15.165.74.195
jm1-ip = 3.35.135.184
jm2-ip = 3.35.139.231
```

# Hosts
## Jenkins1 : Jenkins Server
* password(at First)
```
    ssh -i ~/mykey ubuntu@<ip> "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
```

## jm1      : Tomcat Server
* id/pw : admin/password

## jm2      : Artifactory Server
* id/pw : admin/password

### If your os has rebooted then do this.
* Artifactory reboot.
```
    ssh -i ~/mykey ubuntu@<ip> "sudo /usr/local/sbin/artifactoryReset.sh"
```

### If you wnat to connect Artifactory OS (jm2)
```
    ssh -i ~/mykey ubuntu@<ip> "sudo docker exec -it --user root artifactory bash"
```
