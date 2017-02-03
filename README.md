# unmessage-client

## Docker image for unMessage

This repository contains the Dockerfiles to build a docker image
for [unMessage][unmessage].

To run the container, execute the [start.sh][start] script. With no arguments,
the container will be configured to use the command line, and with the optional "gui"
argument, the container will be configured to use either the command line or gui.
Usage is described in the [unMessage documentation][unmessage-doc].

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

    [unmessage]: https://github.com/AnemoneLabs/unmessage
    [unmessage-doc]: https://unmessage.readthedocs.io/en/latest/
    [start]: https://github.com/rxcomm/unmessage-client/blob/master/util/start.sh
