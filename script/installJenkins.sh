apt-get -y install gradle
apt-get -y install jenkins
apt-get -y install maven
apath=$(dirname $(ls -als $(ls -als $(which mvn) |awk '{print $NF}')|awk '{print $NF}'))
echo export M2_HOME=${apath%/*} >> /etc/bash.bashrc
echo export VAMEN_HOME=${apath%/*} >> /etc/bash.bashrc
echo export PATH=\$PATH:$apath    >> /etc/bash.bashrc
tail /etc/bash.bashrc
. /etc/bash.bashrc
mvn -v
