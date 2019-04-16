wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update && sudo apt-get upgrade
sudo apt-get -y install openjdk-8-jre
sudo apt-get -y install openjdk-8-jdk

echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64">> /etc/bash.bashrc

cat >>/etc/bash.bashrc<< EOF
export LC_ALL="ko_KR.UTF-8"
EOF