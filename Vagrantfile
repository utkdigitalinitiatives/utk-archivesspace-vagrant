Vagrant.configure("2") do |config|

  # grab a CentOS box
  config.vm.box = "centos/7"
  # give it a name
  config.vm.hostname = "testing-aspace"

  # configure the virtualbox
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "3000"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end

end