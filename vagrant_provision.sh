sudo dnf install -y neovim python3-neovim
sudo dnf install -y ripgrep
sudo dnf install -y fzf
git clone https://github.com/enjoythecode/dot.git /home/vagrant/dot
mkdir /home/vagrant/.config
ln -s /home/vagrant/dot/nvim /home/vagrant/.config/nvim
ln -s /home/vagrant/dot/bash /home/vagrant/.bashrc.d
git config --global user.email "sinan.yumurtaci@gmail.com"
git config --global user.name "Sinan Yumurtacı"
