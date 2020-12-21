FROM ubuntu

COPY entrypoint.sh /entrypoint.sh
COPY create_sidebar.py /create_sidebar.py

ENV TEST=TEST
ENV GH_PERSONAL_ACCESS_TOKEN=GH_PERSONAL_ACCESS_TOKEN

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y python3

ENTRYPOINT ["/entrypoint.sh"]
