# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.define :jenkins do |jenkins|
    jenkins.vm.box = "centos6"
    jenkins.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"
    jenkins.vm.host_name = "jenkins-ci"
    jenkins.vm.network :hostonly, "192.168.2.101"
    jenkins.vm.forward_port 8080, 8080
    jenkins.vm.provision :puppet do |puppet|
      puppet.module_path = './modules'
      puppet.manifests_path = '.'
      puppet.manifest_file = 'jenkins.pp'
    end
  end
end
