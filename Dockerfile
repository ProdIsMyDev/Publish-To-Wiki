FROM ubuntu

COPY entrypoint.sh /entrypoint.sh
COPY create_sidebar.py /create_sidebar.py

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

RUN sudo apt-get install python

ENTRYPOINT ["/entrypoint.sh"]
