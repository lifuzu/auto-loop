PASSWORD="PASSWORD"
HOSTNAME=`hostname`
echo $HOSTNAME
#uptime

HOST=server.domain.com
ssh -o "StrictHostKeyChecking no" -p 29418 $HOST
