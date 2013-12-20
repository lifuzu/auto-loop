PASSWORD="PASSWORD"
HOSTNAME=`hostname`
echo $HOSTNAME
#uptime

echo $PASSWORD | sudo -S apt-get update
echo $PASSWORD | sudo -S apt-get install -y python-paramiko

test `dpkg -l python-paramiko  |grep python-paramiko | wc -l` = 1
echo $?

