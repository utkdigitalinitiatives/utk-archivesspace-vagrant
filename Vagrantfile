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

  # configure the networking ports
  # staff interface
  config.vm.network :forwarded_port, guest: 8080, host: 8080, auto_correct: true
  # public interface
  config.vm.network :forwarded_port, guest: 8081, host: 8081, auto_correct: true
  # OAI-PMH interface
  config.vm.network :forwarded_port, guest: 8082, host: 8082, auto_correct: true
  # backend interface
  config.vm.network :forwarded_port, guest: 8089, host: 8089, auto_correct: true
  # Solr admin interface
  config.vm.network :forwarded_port, guest: 8090, host: 8090, auto_correct: true

end