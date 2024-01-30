Vagrant.configure("2") do |config|
  BOX_IMAGE = "ubuntu/jammy64"
  
  PROXY_URL = "http://10.20.5.51:8888"
  NO_PROXY = "localhost,127.0.0.1"
  PROXY_ENABLE = true
  
  BASE_INT_NETWORK = "10.10.20"
  BASE_HOST_ONLY_NETWORK = "192.168.56"

  SSH_INSERT_KEY = false
  CHECK_UPDATE = false
  
  
  
  config.vm.define "web.m340" do |webconfig|
    webconfig.vm.box = BOX_IMAGE
	webconfig.vm.hostname = "web.m340"
	
	webconfig.ssh.insert_key = SSH_INSERT_KEY
    webconfig.vm.box_check_update = CHECK_UPDATE
	
	webconfig.vm.provision "shell", path: "scripts/comandiWeb.sh"
	
	webconfig.vm.network "private_network", ip: BASE_INT_NETWORK + ".10", virtualbox__intnet: true
	webconfig.vm.network "private_network", ip: BASE_HOST_ONLY_NETWORK + ".10"
	
	if Vagrant.has_plugin?("vagrant-proxyconf")
	  if PROXY_ENABLE == true
	    webconfig.proxy.http = PROXY_URL
	    webconfig.proxy.https = PROXY_URL
	    webconfig.proxy.no_proxy = NO_PROXY
	  end
	end
	
	webconfig.vm.provider "virtualbox" do |vb|
	  vb.name = "web.m340"
      # vb.gui = true
      vb.memory = "1024"
    end
	
	webconfig.vm.synced_folder "./site", "/var/www/html"
  end

  config.vm.define "db.m340" do |dbconfig|
    dbconfig.vm.box = BOX_IMAGE
	dbconfig.vm.hostname = "db.m340"
	
	dbconfig.ssh.insert_key = SSH_INSERT_KEY
    dbconfig.vm.box_check_update = CHECK_UPDATE
	
	dbconfig.vm.provision "shell", path: "scripts/comandiDb.sh"
	
	dbconfig.vm.network "private_network", ip: BASE_INT_NETWORK + ".11", virtualbox__intnet: true
	
	if Vagrant.has_plugin?("vagrant-proxyconf")
	  if PROXY_ENABLE == true
	    dbconfig.proxy.http = PROXY_URL
	    dbconfig.proxy.https = PROXY_URL
	    dbconfig.proxy.no_proxy = NO_PROXY
	  end
	end
	
	dbconfig.vm.provider "virtualbox" do |vb|
	  vb.name = "db.m340"
      # vb.gui = true
      vb.memory = "1024"
    end
  end
end
