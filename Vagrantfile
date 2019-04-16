# -*- mode: ruby -*-
# vi: set ft=ruby :
SUBNET="172.22.101"
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"               
  # totest:  bento/ubuntu-18.04
  
  # jenkins Server
  config.vm.define "jenkins1" do |server|
    server.vm.hostname = "jenkins1"
    server.vm.provider :virtualbox do |v|
      v.name = "jenkins1"
    end    
    server.vm.network "private_network", ip: "#{SUBNET}.101"
    server.vm.provision "shell", path: "./script/base.sh", args: ""
    server.vm.provision "shell", path: "./script/installJenkins.sh", args: ""
    server.vm.provision "shell", path: "./script/setHosts.sh", args: "#{SUBNET}"
  end  

  # Web Server
  config.vm.define "jm1" do |jm|
    jm.vm.hostname = "jm1"
    jm.vm.provider :virtualbox do |v|
      v.name = "jm1"
    end    
    jm.vm.network "private_network", ip: "#{SUBNET}.111"
    jm.vm.provision "shell", path: "./script/base.sh", args: ""
    jm.vm.provision "shell", path: "./script/install_tomcat.sh", args: ""
    jm.vm.provision "shell", path: "./script/setHosts.sh", args: "#{SUBNET}"
  end  

  # Artifactory Server
  config.vm.define "jm2" do |jm|
    jm.vm.hostname = "jm2"
    jm.vm.provider :virtualbox do |v|
      v.name = "jm2"
    end    
    jm.vm.network "private_network", ip: "#{SUBNET}.121"
    jm.vm.provision "shell", path: "./script/base.sh", args: ""
    jm.vm.provision "shell", path: "./script/artifactory.sh", args: ""
    jm.vm.provision "shell", path: "./script/setHosts.sh", args: "#{SUBNET}"
  end  

end

