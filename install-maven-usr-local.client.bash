PASSWORD="PASSWORD"
HOSTNAME=`hostname`
echo $HOSTNAME
#uptime

DOWNLOAD_URL=http://platnas02/platform/tools
DOWNLOAD_PACKAGE=apache-maven-3.1.1-bin.tar.gz
[ ! -d Downloads ] && mkdir Downloads
wget $DOWNLOAD_URL/$DOWNLOAD_PACKAGE -O Downloads/$DOWNLOAD_PACKAGE
cd /usr/local

echo $PASSWORD | sudo -S tar -zxf ~/Downloads/$DOWNLOAD_PACKAGE
echo $PASSWORD | sudo -S ln -s `basename $DOWNLOAD_PACKAGE -bin.tar.gz` maven
echo $PASSWORD | sudo -S ln -s /usr/local/maven/bin/mvn /usr/local/bin/mvn

# it is better to add /urs/local/maven to PATH in ~/.bashrc, then export it

test `mvn --version | grep 3.1.1 | wc -l` = 1
echo $?
