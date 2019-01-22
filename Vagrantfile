Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 1
  end

  config.vm.define "micro" do |micro|
	micro.vm.hostname = "micro"
    micro.vm.box = "ubuntu/bionic64"
	micro.vm.network "private_network", ip: "192.168.70.50"
	
	micro.vm.provision "shell", path: "bootstrap-docker.sh", run: "always"
	micro.vm.provision "shell", path: "bootstrap-mongodb.sh", run: "always"
	micro.vm.provision "shell", path: "bootstrap-kafka.sh", run: "always"
  end
end