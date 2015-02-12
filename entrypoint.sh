#!/bin/bash
if [ "$HOSTIP" == "AWS" ]
then
	HOSTIP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
fi
export _JAVA_OPTIONS=\"-Djava.rmi.server.hostname=$HOSTIP\"
sed -i -e "s/192.168.59.103/$HOSTIP/" /jmeter/bin/jmeter.properties
exec "$@"
