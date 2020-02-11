FROM ubuntu:18.04

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python

#  && pip3 install --upgrade pip\
COPY requirements.txt /tmp
WORKDIR /tmp
RUN pip3 install -r requirements.txt

COPY cut.py /home
COPY Hotel-4f4067fc1229.json /home
WORKDIR /home

CMD [ "sh", "-c", "python3 cut.py" ]


