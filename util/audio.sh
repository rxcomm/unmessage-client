#!/bin/bash

usage(){
  echo "This script starts a container using the unmessage-client-audio image."
  echo ""
  echo "Usage: $0 <docker daemon ip address> <pulseaudio port number>"
  echo ""
  echo "Be sure to run the dockerpulse.sh script first to get the pulseaudio"
  echo "port number and authenticate the docker container to the host pulseaudio"
  exit 1;
}

if [ "$#" -eq 2 ]; then
  sudo docker run -e LOCAL_USER_ID=`id \
                  -u $USER` \
                  -it --rm \
                  -e PULSE_SERVER=$1:$2 \
                  -v /home/$USER/.config:/home/user/.config \
                     rxcomm/unmessage-client-audio
else
  usage
fi
