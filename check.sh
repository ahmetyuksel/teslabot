#/bin/sh

if [ -f /tmp/tesla.log ]
then
    if [ $(cat /tmp/tesla.log | grep -i 'exception\|timeout' | wc -l) -ne 0 ]
    then
        exit 2
    else
        exit 0
    fi
else
    exit 0
fi

#if app is going down periodiccaly, it is loggin exeption error. This is usually a problem when running on container platforms such as okd-openshift.
#add this file into your Dockerfile
#COPY check.sh check.sh
#RUN chmod +x check.sh

#then add readness check or healtcheck on your container platform
#Readiness Probe: /bin/sh /opt/will/check.sh 5s delay, 30s timeout
#Liveness Probe: /bin/sh /opt/will/check.sh 5s delay, 30s timeout
