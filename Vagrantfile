# -*- mode: ruby -*-
# vi: set ft=ruby :
SUBNET="172.22.101"
Vagrant.configure("2") do |config|
  #config.vm.box = "ubuntu/xenial64"
  config.vm.box = "generic/ubuntu1804"
  # totest:  bento/ubuntu-18.04

  # jenkins Server
  config.vm.define "jenkins1" do |jenkins1|
    jenkins1.vm.hostname = "jenkins1"
    jenkins1.vm.provider :virtualbox do |v|
      v.name = "jenkins1"
      v.customize [
        "modifyvm", :id,
        "--memory", "2048",
       ]
    end

    jenkins1.vm.network "private_network", ip: "#{SUBNET}.101"
    jenkins1.vm.network "forwarded_port", guest: 8080, host: 8888, auto_correct: true
    jenkins1.vm.provision "shell", path: "./script/base.sh", args: ""
    jenkins1.vm.provision "shell", path: "./script/installJenkins.sh", args: ""
    jenkins1.vm.provision "shell", path: "./script/setHosts.sh", args: "#{SUBNET}"
  end

  # Web Server
  config.vm.define "jm1" do |jm1|
    jm1.vm.hostname = "jm1"
    jm1.vm.provider :virtualbox do |v|
      v.name = "jm1"
    end
    jm1.vm.network "private_network", ip: "#{SUBNET}.111"
    jm1.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
    jm1.vm.provision "shell", path: "./script/base.sh", args: ""
    jm1.vm.provision "shell", path: "./script/install_tomcat.sh", args: ""
    jm1.vm.provision "shell", path: "./script/setHosts.sh", args: "#{SUBNET}"
  end

  # Artifactory Server
  config.vm.define "jm2" do |jm2|
    jm2.vm.hostname = "jm2"
    jm2.vm.provider :virtualbox do |v|
      v.name = "jm2"
      v.customize [
        "modifyvm", :id,
        "--memory", "2048",
       ]

    end

    jm2.vm.network "private_network", ip: "#{SUBNET}.121"
    jm2.vm.network "forwarded_port", guest: 8081, host: 8081, auto_correct: true
    jm2.vm.provision "shell", path: "./script/base.sh", args: ""
    jm2.vm.provision "shell", path: "./script/artifactory.sh", args: ""
    jm2.vm.provision "shell", path: "./script/setHosts.sh", args: "#{SUBNET}"
  end

end
