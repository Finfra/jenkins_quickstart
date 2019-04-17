# Usage
```
git clone https://github.com/Finfra/jenkins_quickstart
cd jenkins_quickstart
vagrant up
```

# For windows User
* after 'vagrant up', u must do network setting 
## jenkins1
click setting → Network →  Adapter1 → Port forwarding →  "+" button →  Rule1(Host IP:127.0.0.1,HostPort:80,GUEST IP:(not set),GuestPort:8080) →  OK

## jm1(Tomcat Server)
click setting → Network →  Adapter1 → Port forwarding →  "+" button →  Rule1(Host IP:127.0.0.1,HostPort:8080,GUEST IP:(not set),GuestPort:8080) →  OK

## jm2(Artifactory Server)
click setting → Network →  Adapter1 → Port forwarding →  "+" button →  Rule1(Host IP:127.0.0.1,HostPort:81,GUEST IP:(not set),GuestPort:8081) →  OK


# for Ubuntu/Mac User
* after 'vagrant up', u must do network setting
System Preference →  Network →  "+" button →  Network CIDR: 172.22.101.0/24 →  OK
exec cute ". check.sh"



# If ur os has rebooted then do this.
vagrant ssh jm2 -c "sudo docker start artifactory"
