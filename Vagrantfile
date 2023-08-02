VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "generic/fedora37"

  #
  # Use host authenticaton for git and maven.
  #
  # Ensure host private key is registered with host SSH agent:
  #
  # ssh-add -L
  # ssh-add ~/.ssh/id_rsa
  # ssh-add -L
  #

  config.ssh.private_key_path = ["~/.ssh/id_rsa", "~/.vagrant.d/insecure_private_key"]
  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
    vb.cpus = 4
  end

  # config.vm.synced_folder "~/.m2", "/home/vagrant/.m2"

  config.vm.provision :shell, path: "vagrant_provision.sh"
end