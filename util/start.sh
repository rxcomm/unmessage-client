#!/bin/bash

RUNMODE=$1

test "$RUNMODE" == "gui" && \
  sudo docker run -it \
    -e DISPLAY=$DISPLAY \
    -e LOCAL_USER_ID=`id -u $USER` \
    -v /home/$USER/.config:/home/user/.config \
    -v /tmp/.X11-unix:/tmp/.X11-unix rxcomm/unmessage-client || \
  sudo docker run -it \
    -e LOCAL_USER_ID=`id -u $USER` \
    -v /home/$USER/.config:/home/user/.config rxcomm/unmessage-client
