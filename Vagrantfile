# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "centos6"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box"

  config.vm.network "forwarded_port", guest: 8080, host: 8080

  # This block makes it so when you're working via a VPN, DNS resolution still works
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.memory = 1024
  end

  config.vm.host_name = "jenkins-ci"

  config.vm.provision "puppet" do |puppet|
    puppet.module_path    = './modules'
    puppet.manifests_path = '.'
    puppet.manifest_file  = 'jenkins.pp'
  end

end
