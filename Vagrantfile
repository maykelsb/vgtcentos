Vagrant.configure(2) do |config|
  config.vm.box = "matyunin/centos7"
  config.vm.network "forwarded_port", guest: 80, host: 10080

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "vgtweb.pp"
  end

end
