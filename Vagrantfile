Vagrant.configure("2") do |config|
  NODES = 3

  config.vbguest.auto_update = false
  config.vm.box_check_update = false
  config.vm.box = "Dougs71/CentOS-7.6.1810-Minimal"
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
  config.ssh.insert_key = false
  config.ssh.private_key_path = ['provision/vagrant']

  config.vm.define "control" do |control|
    control.vm.hostname = "control"

    config.vm.provider "virtualbox" do |vb|
      vb.name = "control"
      vb.memory = "512"
      vb.cpus = "1"
    end

    control.vm.network "private_network", ip: "10.69.0.1"

    control.vm.provision "shell", path: "provision/control.sh", privileged: false
  end

  (1..NODES).each do |node_id|
    config.vm.define "node#{node_id}" do |node|
      node.vm.box = "Dougs71/CentOS-7.6.1810-Minimal"
      node.vm.hostname = "node#{node_id}"
      node.vm.network "private_network", ip: "10.69.0.#{1+node_id}"

      node.vm.provider "virtualbox" do |vb|
        vb.memory = "512"
        vb.cpus = "1"
        vb.name = "node#{node_id}"
      end
    end
  end

  config.vm.provision "shell", path: "provision/common.sh", privileged: false
end