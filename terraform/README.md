# Usage
* Script
```
git config --global core.autocrlf false
git config --global core.eol lf
git clone https://github.com/Finfra/jenkins_quickstart
cd jenkins_quickstart/terraform/
ssh-keygen -f ~/.ssh/id_rsa -N ''

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

* Host File Setting Example for client
```
echo "
15.165.74.195  jenkins
3.35.135.184  jm1
3.35.139.231  jm2
">> /etc/hosts

curl jenkins:8080|head -n 100
curl jm1:8080|head -n 100
curl jm2:8082|head -n 100
```

# Hosts
## Jenkins1 : Jenkins Server
* password(at First)
```
    ssh jenkins "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
```

## jm1      : Tomcat Server
* id/pw : admin/password

## jm2      : Artifactory Server
* id/pw : admin/password

### OS를 재부팅했다면?
* Artifactory reboot.
```
    ssh jm1 "sudo /usr/local/sbin/artifactoryReset.sh"
```

### If you wnat to connect Artifactory OS (jm2)
```
    ssh jm2 "sudo docker exec -it --user root artifactory bash"
```
