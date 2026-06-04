#! /bin/bash

LOGFILE="/home/amir/bash_practices/service-check/result.log"
DATE=$(date "+%Y-%m-%d %H:%M:%S")

if systemctl is-active --quiet docker; then
	echo "$DATE - docker is active" >> $LOGFILE
else
	echo "$DATE - docker is inactive - attemping to restart" >> "$LOGFILE"
	systemctl restart docker
	if systemctl is-active --quiet docker; then
		echo "$DATE - docker restarted succesfully" >> $LOGFILE
	else 
		echo "$DATE - docker restart Failed" >> $LOGFILE
	fi
fi
