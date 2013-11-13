PASSWORD="<PASSWORD>"
HOSTNAME=`hostname`
hostname
#uptime

#wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
#echo $PASSWORD | sudo -S dpkg -i puppetlabs-release-precise.deb
#echo $PASSWORD | sudo -S apt-get update
#echo $PASSWORD | sudo -S apt-get install -y puppet

#ps aux | grep puppet
puppet --version

# config
# 1.
# /etc/default/puppet, START=no to START=yes
# 2.
# /etc/puppet/puppet.conf, insert the following lines:
# server = platbuild30.sjc1700.bnweb.user.bn
# report = true
# pluginsync = true
# certname = $HOSTNAME.sjc1700.bnweb.user.bn
# masterport = 8141

# before '[master]'

#Implementation:
# grep platbuild30 /etc/puppet/puppet.conf
# if [ $? != 0 ]; then
# echo $PASSWORD | sudo -S sed -i '/^\[master\]$/i \
# server = platbuild30.sjc1700.bnweb.user.bn \
# report = true \
# pluginsync = true \
# certname = '"$HOSTNAME"'.sjc1700.bnweb.user.bn \
# masterport = 8141 \
# ' /etc/puppet/puppet.conf
# fi

# Trigger puppet agent
echo $PASSWORD | sudo -S puppet agent
