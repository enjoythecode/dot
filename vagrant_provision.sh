sudo dnf install -y neovim
sudo dnf install -y python3-devel.x86_64
sudo dnf install -y python3-pip
sudo dnf install -y python3-neovim
sudo dnf install -y ripgrep
sudo dnf install -y fzf

python3 -m pip install beancount neovim pandas

# clone with HTTPS and then switch to SSH because I am lazy and
# don't want to figure out how to automatically add the GitHub host
# to my trusted SSH prints.
git clone https://github.com/enjoythecode/dot.git /home/vagrant/dot
(cd dot && git remote set-url origin git@github.com:enjoythecode/dot.git)

mkdir /home/vagrant/.config
ln -s /home/vagrant/dot/nvim /home/vagrant/.config/nvim
mkdir /home/vagrant/.bashrc.d
ln -s /home/vagrant/dot/bash/entry.sh /home/vagrant/.bashrc.d/entry.sh

# this install nvim plugins (those that can install themselves within 10
# seconds, anyways) so that I don't have to wait for it in the first launch of
# nvim
# however, it has been broken for a while because the installation requires user
# input to get past errors of not finding plugins in the first place.
# some things to try:
# add "+<CR>" as the first command to "confirm" those warnings automatically
# somehow guard my init.vim, plugins.lua against not having installed some of
# the plugins
# nvim "+:PlugInstall" "+:sleep 1" "+:q" "+:q"

git config --global pull.rebase true
git config --global user.email "sinan.yumurtaci@gmail.com"
git config --global user.name "Sinan Yumurtacı"
