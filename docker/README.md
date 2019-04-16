# Reference
```
https://github.com/jenkinsci/docker/blob/master/README.md
```

# Usage
```
docker-compose up -d
docker exec -it $(basename $(pwd))_jenkins_1 cat /var/jenkins_home/secrets/initialAdminPassword
open 127.0.0.1

```

# CF
* Connect by Root
```
docker exec -it --user root docker_jenkins_1 bash
```
