echo Provisioning common...

sudo -H -u vagrant bash -c 'yes y | ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa'
cp /vagrant/provision/vagrant ~/.ssh/id_rsa
cp /vagrant/provision/vagrant.pub ~/.ssh/id_rsa.pub
cat /vagrant/provision/vagrant.pub >> ~/.ssh/authorized_keys
sudo chmod 0600 ~/.ssh/*
sudo cp -f /vagrant/provision/hosts /etc

# Set SELinux in permissive mode (effectively disabling it)
sudo setenforce 0
sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config