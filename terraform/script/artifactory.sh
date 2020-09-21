#!/bin/bash
until [ -f /var/lib/cloud/instance/boot-finished ] && [ -f /tmp/base.sh_ok ]; do
  sleep 1
done

echo --------------------------------------------------------------------------------
echo "- artifactory.sh start"
echo --------------------------------------------------------------------------------

# echo "deb https://jfrog.bintray.com/artifactory-debs xenial main" | tee -a /etc/apt/sources.list
# # echo "deb http://jfrog.bintray.com:80/v1/content/jfrog/artifactory-debs/ xenial main" | tee -a /etc/apt/sources.list

# curl https://bintray.com/user/downloadSubjectPublicKey?username=jfrog | apt-key add -

# apt-get update
# apt-get install jfrog-artifactory-oss

curl -s https://get.docker.com/ | sudo sh


echo '
mkdir -p  /artifactory
chmod 777 -R /artifactory

docker rm -f artifactory ;docker run -d        \
   --name artifactory                          \
   -p 8081:8081                                \
   -p 8082:8082                                \
   -v /artifactory:/var/opt/jfrog/artifactory  \
   docker.bintray.io/jfrog/artifactory-oss:latest
    # -v /vagrant/artifactory:/var/opt/jfrog/artifactory \

# docker exec -d artifactory chmod 777 /var/opt/jfrog/artifactory
# docker exec -d artifactory chown -R 1030:1030 /var/opt/jfrog/artifactory
'>/usr/local/sbin/artifactoryReset.sh
chmod +x /usr/local/sbin/artifactoryReset.sh
bash /usr/local/sbin/artifactoryReset.sh


echo '
echo "
172.22.101.101  jenkins1
172.22.101.111  jm1
172.22.101.121  jm2
">> /etc/hosts
'> /tmp/tnowage.sh
docker cp /tmp/tnowage.sh artifactory:/tmp/
docker exec -d --user root artifactory bash /tmp/tnowage.sh
chmod +x /usr/local/sbin/artifactoryReset.sh

ufw allow 8081
ufw allow 8082





# systemctl start artifactory.service
# systemctl status artifactory.service


echo --------------------------------------------------------------------------------
echo "- artifactory.sh end"
echo --------------------------------------------------------------------------------
