useradd -s /bin/false  -d /opt/tomcat tomcat
rm -rf /opt/tomcat
mkdir /opt/tomcat
chown tomcat:tomcat /opt/tomcat
wget http://mirror.apache-kr.org/tomcat/tomcat-7/v7.0.94/bin/apache-tomcat-7.0.94.tar.gz  
tar xzvf apache-tomcat-7.0.94.tar.gz -C /opt/tomcat --strip-components=1
chgrp -R tomcat /opt/tomcat
mkdir /opt/tomcat/conf
chmod -R g+r /opt/tomcat/conf
chmod g+x /opt/tomcat/conf
chown -R tomcat /opt/tomcat/webapps/ /opt/tomcat/work/ /opt/tomcat/temp/ /opt/tomcat/logs/
echo '<?xml version="1.0" encoding="utf-8"?>
<tomcat-users>
  <role rolename="manager-script"/>
  <role rolename="manager-gui"/>
  <user username="admin" password="password" roles="admin,manager,manager-gui,admin-script,manager-gui,manager-script,manager-jmx,manager-status"/>
  <user username="admin" password="password" roles="admin,manager-gui,admin-gui"/>
</tomcat-users>
'>/opt/tomcat/conf/tomcat-users.xml
chmod 0640 /opt/tomcat/conf/tomcat-users.xml
chown  tomcat /opt/tomcat/conf/tomcat-users.xml

echo "
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

Environment=JAVA_HOME=$JAVA_HOME
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'
Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

User=tomcat
Group=tomcat
UMask=0007
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target
">/etc/systemd/system/tomcat.service

systemctl daemon-reload
systemctl start tomcat
systemctl status tomcat
ufw allow 8080

curl http://localhost:8080 > /tmp/nginx_ok
systemctl enable tomcat

