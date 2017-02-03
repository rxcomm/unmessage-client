FROM rxcomm/jessie-base

ENV PYTHON_DEPS setuptools pysocks stem magic-wormhole txtorcon pyaxo unmessage

RUN echo "deb http://deb.torproject.org/torproject.org jessie main" >> /etc/apt/sources.list && \
    gpg --keyserver keys.gnupg.net --recv A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 && \
    gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add - && \
    apt-get update && \
    apt-get install -y python python-dev \
    libffi-dev libssl-dev tor torsocks tor-geoipdb python-tk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    curl https://bootstrap.pypa.io/get-pip.py | python

RUN pip install $PYTHON_DEPS

RUN ln -s /usr/local/lib/python2.7/dist-packages/usr/share/pyaxo/examples/axotor.py /usr/local/bin/axotor && \
    ln -s /usr/local/lib/python2.7/dist-packages/usr/share/pyaxo/examples/wh.py /usr/local/bin/wh.py && \
    ln -s /usr/local/lib/python2.7/dist-packages/usr/share/pyaxo/examples/smp.py /usr/local/bin/smp.py

WORKDIR /home/user

CMD ["/bin/bash"]
