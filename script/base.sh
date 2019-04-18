wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update && apt-get upgrade
apt-get -y install openjdk-8-jre
apt-get -y install openjdk-8-jdk
apt-get -y install tree

echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64">> /etc/bash.bashrc

cat >>/etc/bash.bashrc<< EOF
export LC_ALL="ko_KR.UTF-8"
EOF