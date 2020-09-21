#!/bin/bash
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

echo --------------------------------------------------------------------------------
echo "- base.sh start"
echo --------------------------------------------------------------------------------


echo --------------------------------------------------------------------------------
echo "- install base app"
echo --------------------------------------------------------------------------------

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
apt -y update && apt -y upgrade
apt -y install openjdk-8-jre
apt -y install openjdk-8-jdk
apt -y install tree

echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64">> /etc/bash.bashrc

locale-gen ko_KR.UTF-8
export LC_ALL=C.UTF-8
export DEBIAN_FRONTEND=noninteractive
echo "export LC_ALL=C.UTF-8">>/etc/bash.bashrc
echo "export DEBIAN_FRONTEND=noninteractive">>/etc/bash.bashrc


echo --------------------------------------------------------------------------------
echo "- setHost"
echo --------------------------------------------------------------------------------


echo "
172.22.101.101  jenkins1
172.22.101.111  jm1
172.22.101.121  jm2
">> /etc/hosts


echo --------------------------------------------------------------------------------
echo "- base.sh end"
echo --------------------------------------------------------------------------------
touch /tmp/base.sh_ok
