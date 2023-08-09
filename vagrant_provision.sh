sudo dnf install -y neovim python3-neovim
sudo dnf install -y ripgrep
sudo dnf install -y fzf
sudo dnf install -y python3-pip

# clone with HTTPS and then switch to SSH because I am lazy and 
# don't want to figure out how to automatically add the GitHub host
# to my trusted SSH prints.
git clone https://github.com/enjoythecode/dot.git /home/vagrant/dot
(cd dot && git remote set-url origin git@github.com:enjoythecode/dot.git)

mkdir /home/vagrant/.config
ln -s /home/vagrant/dot/nvim /home/vagrant/.config/nvim
mkdir /home/vagrant/.bashrc.d
ln -s /home/vagrant/dot/bash/entry.sh /home/vagrant/.bashrc.d/entry.sh

git config pull.rebase true
git config --global user.email "sinan.yumurtaci@gmail.com"
git config --global user.name "Sinan Yumurtacı"

python3 -m pip install neovim
# this one does not yet work, for some reason...
# python3 -m pip install beancount
