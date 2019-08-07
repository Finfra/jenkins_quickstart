# Usage
```
git clone https://github.com/Finfra/jenkins_quickstart
cd jenkins_quickstart
vagrant up
# Linux/macOS
. check.sh
# Windows User
check.bat
```

# Hosts
## Jenkins1 : Jenkins Server
* password(at First)
```
vagrant ssh jenkins1 -c "sudo cat password /var/lib/jenkins/secrets/initialAdminPassword"
```

## jm1      : Tomcat Server
* id/pw : admin/password

## jm2      : Artifactory Server 
* id/pw : admin/password

### If your os has rebooted then do this.
* Artifactory reboot.
```
vagrant ssh jm2 -c "sudo artifactoryReset.sh"
```

### If you wnat to connect Artifactory OS (jm2)
```
    vagrant ssh jm2 -c "sudo docker exec -it --user root artifactory bash"
```


# Setting for direct connecting for Ubuntu/Mac
* After 'vagrant up', if you do this network setting then you can connect guest os directly.
* System Preference →  Network →  "+" button →  Network CIDR: 172.22.101.0/24 →  OK
* Check 
```
bash check.sh
```


# Manual port forward Setting
* It was done by Vagrant Script
* Essential for windows User

## jenkins1
    click setting → Network →  Adapter1 → Port forwarding →  "+" button →  Rule1(Host IP:127.0.0.1,HostPort:8888,GUEST IP:(not set),GuestPort:8080) →  OK

## jm1(Tomcat Server)
    click setting → Network →  Adapter1 → Port forwarding →  "+" button →  Rule1(Host IP:127.0.0.1,HostPort:8080,GUEST IP:(not set),GuestPort:8080) →  OK

## jm2(Artifactory Server)
    click setting → Network →  Adapter1 → Port forwarding →  "+" button →  Rule1(Host IP:127.0.0.1,HostPort:8081,GUEST IP:(not set),GuestPort:8081) →  OK
