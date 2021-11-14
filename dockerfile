FROM ubuntu:latest

RUN apt-get update -y && apt install mysql-server redis-server python3-pip libmysqlclient-dev git python-dev -y

RUN mkdir /sqlmap 

WORKDIR /sqlmap

RUN git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev && ln -s /sqlmap/sqlmap-dev/sqlmap.py /usr/bin/sqlmap

RUN mkdir /APISPloit

WORKDIR /APISPloit

COPY requirements.txt /APISPloit

COPY APISPloit /APISPloit/

RUN pip3 install -r requirements.txt

COPY entrypoint.sh /APISPloit/

RUN chmod +x entrypoint.sh

ENV IP_ADDRESS=127.0.0.1:8000

EXPOSE 8000

COPY ngrok /APISPloit/

ENTRYPOINT ./entrypoint.sh && bash