# unmessage-client

## Docker image for unMessage

This repository contains the Dockerfiles to build a docker image
for [unMessage](https://github.com/AnemoneLabs/unmessage).

Clone the repository using the ```--recursive``` flag - e.g.:

     git clone --recursive https://github.com/rxcomm/unmessage-client

To run the container, execute the [start.sh](util/start.sh) script. With no arguments,
the container will be configured to use the command line, and with the optional "gui"
argument, the container will be configured to use either the command line or gui.
unMessage usage is described in the
[unMessage documentation](https://unmessage.readthedocs.io/en/latest/).

### Comand line interface

At the container bash prompt, execute the command ```unmessage-cli -n <nickname>```.
An unMessage instance will start. After the first time you run unmessage, you can
simply execute the command ```unmessage``` at the bash prompt to return to your
previous configuration.

### GUI interface

If you have started the container with the optional "gui" argument, start the GUI
by executing ```unmessage-gui``` at the bash prompt. Enter your nickname in the Name
box of the Start Peer window and click ```Start```. After the first time you run
unmessage, you can simply execute the command ```unmessage``` at the bash prompt
to return to your previous configuration.

### unMessage develop branch (includes audio chat)

The develop branch of unMessage has experimental audio chat support. The
docker image rxcomm/unmessage-client-audio has the develop branch of
unMessage installed. Audio chats are started and stopped with the ```/untalk```
command.

In order to get this to work, you need to configure your host pulseaudio so
that the docker container can access it. You do this by running the
[dockerpulse.sh](util/dockerpulse.sh) script. This will authenticate the
docker container so that it can use the host's pulseaudio. Then start
the rxcomm/unmessage-client-audio container using the [audio.sh](util/audio.sh)
script. The output of the dockerpulse.sh script gives you all of the
required parameters for the audio.sh script.

Once you've started the container with the audio.sh script, run unmessage
as usual, and you will find the ```/untalk``` and ```/untalk-devices``` commands
available.

### axotor

It is also possible to run the
[axotor](https://github.com/rxcomm/pyaxo/blob/master/examples/axotor.py)
application from this container. To start axotor, execute the command
```axotor [-s|-c]```. Further details on using axotor are provided in
the python docstring linked above.
