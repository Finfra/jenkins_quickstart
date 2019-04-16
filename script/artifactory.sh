echo "deb http://jfrog.bintray.com:80/v1/content/jfrog/artifactory-debs/ xenial main" | tee -a /etc/apt/sources.list
curl https://bintray.com/user/downloadSubjectPublicKey?username=jfrog | apt-key add -

apt-get update
apt-get install jfrog-artifactory-oss

ufw allow 8081
ufw allow 8080

systemctl start artifactory.service
systemctl status artifactory.service