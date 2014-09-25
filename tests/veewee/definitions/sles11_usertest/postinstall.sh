#
# postinstall.sh
# Taken from https://github.com/jedi4ever/veewee/blob/master/templates/openSUSE-12.3-x86_64-NET_EN/postinstall.sh
#

date > /etc/vagrant_box_build_time

# remove zypper package locks
rm -f /etc/zypp/locks

# install vagrant key
mkdir -pm 700 /home/vagrant/.ssh
curl -Lo /home/vagrant/.ssh/authorized_keys 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant: /home/vagrant/.ssh

# set vagrant sudo
printf "%b" "
# added by veewee/postinstall.sh
vagrant ALL=(ALL) NOPASSWD: ALL
" >> /etc/sudoers

# speed-up remote logins
printf "%b" "
# added by veewee/postinstall.sh
UseDNS no
" >> /etc/ssh/sshd_config
