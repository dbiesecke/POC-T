# Base python 2.7 build, inspired by
# https://github.com/crosbymichael/python-docker/blob/master/Dockerfile
FROM ubuntu:latest
MAINTAINER dbiesecke

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    build-essential \
    ca-certificates \
    gcc \
    git \
    libpq-dev \
    make \
    python-pip \
    python2.7 \
    python2.7-dev\
    python-gevent \
    python-beautifulsoup \
    ssh \
    && apt-get autoremove \
    && apt-get clean

RUN pip install -U "setuptools==3.4.1"
RUN pip install -U "pip==1.5.4"
RUN pip install -U "Mercurial==2.9.1"
RUN pip install -U "virtualenv==1.11.4"
RUN pip install google-api-python-client
RUN pip install bs4
RUN pip install shodan
#RUN mkdir root
WORKDIR /root

ADD . .
ENTRYPOINT ["./POC-T.py"]
CMD ["-h"]
