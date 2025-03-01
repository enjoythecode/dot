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

  # config.vm.network "private_network", ip: "10.10.10.10" 

  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
    vb.cpus = 4
  end

  config.vm.synced_folder "~/S", "/home/vagrant/S", create: true

  config.vm.provision "shell" do |s|
    ssh_prv_key = ""
    ssh_pub_key = ""
    if File.file?("#{Dir.home}/.ssh/id_rsa")
      ssh_prv_key = File.read("#{Dir.home}/.ssh/id_rsa")
      ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
    else
      puts "No SSH key found. You will need to remedy this before pushing to the repository."
    end
    s.inline = <<-SHELL
      if grep -sq "#{ssh_pub_key}" /home/vagrant/.ssh/authorized_keys; then
        echo "SSH keys already provisioned."
        exit 0;
      fi
      echo "SSH key provisioning."
      mkdir -p /home/vagrant/.ssh/
      touch /home/vagrant/.ssh/authorized_keys
      echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
      echo #{ssh_pub_key} > /home/vagrant/.ssh/id_rsa.pub
      chmod 644 /home/vagrant/.ssh/id_rsa.pub
      echo "#{ssh_prv_key}" > /home/vagrant/.ssh/id_rsa
      chmod 600 /home/vagrant/.ssh/id_rsa
      chown -R vagrant:vagrant /home/vagrant
      exit 0
    SHELL
  end

  #config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/user.pub"
  #config.vm.provision "shell", inline: "cat '/home/vagrant/.ssh/user.pub' >> '/home/vagrant/.ssh/authorized_keys'"

  config.vm.provision :shell, path: "vagrant_provision.sh", privileged: false
  config.vm.network "forwarded_port", guest: 5000, host: 5001
end
