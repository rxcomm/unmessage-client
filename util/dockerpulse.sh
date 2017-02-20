#!/bin/bash

# from:
#https://stackoverflow.com/questions/28985714/run-apps-using-audio-in-a-docker-container

echo "Configuring pulseaudio sound over tcp for docker container"
echo ""

# find an open port
read LOWERPORT UPPERPORT < /proc/sys/net/ipv4/ip_local_port_range
while : ; do
 PULSE_PORT="`shuf -i $LOWERPORT-$UPPERPORT -n 1`"
 ss -lpn | grep -q ":$PULSE_PORT " || break
done
echo "Pulse port: "$PULSE_PORT

# get the docker daemon ip address
DOCKER_DAEMON=`ip -4 -o a | grep docker0 | awk '{print $4}'`
DOCKER_DAEMON_SHORT=${DOCKER_DAEMON%/*}
echo "Docker daemon: "$DOCKER_DAEMON_SHORT

# load pulseaudio tcp module, authenticate the docker daemon ip
PULSE_MODULE_ID=$(pactl load-module module-native-protocol-tcp \
                  port=$PULSE_PORT auth-ip-acl=$DOCKER_DAEMON)
echo "Pulse module id: "$PULSE_MODULE_ID

# export the module id number
export PULSE_MODULE_ID

echo ""
echo "Now run: ./audio.sh $DOCKER_DAEMON_SHORT $PULSE_PORT"
echo "to start the container"
echo ""
echo "To unload the pulseaudio module, run: pactl unload-module $PULSE_MODULE_ID"


